import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../../pages/begin/data/models/app_info.dart';
import '../../pages/begin/data/models/nft_info.dart';
import '../../pages/begin/data/models/token_info.dart';
import '../../pages/begin/data/models/wallet_info.dart';
import '../util/constant.dart';
import '../util/theme.dart';
import '../util/web3/abi/stream_chicken_2.g.dart';
import '../util/web3/wallet_connect_helper.dart';

/// Web3Client - 操作合約
Provider<Web3Client> web3ClientProvider = Provider<Web3Client>((ref) {
  Web3Client web3client = Web3Client(WalletConnectHelper.ethRinkebyTestnetEndpoints, Client());
  return web3client;
});

/// 連結錢包的工具類
Provider<WalletConnectHelper> wcHelperProvider = Provider<WalletConnectHelper>(
  (ref) {
    final WalletConnectHelper walletConnectHelper = WalletConnectHelper(
      appInfo: AppInfo(
        name: "Chicken Wallet",
        description: "I am hot",
        url: "https://chick.wallet.mobile.com",
      ),
    );
    return walletConnectHelper;
  },
);

/// 已連結的錢包資訊
StateNotifierProvider<WalletConnectedNotifier, List<WalletInfo>> walletConnectedProvider =
    StateNotifierProvider<WalletConnectedNotifier, List<WalletInfo>>((ref) {
  List<Stream_chicken_2> contractList = ref.read(contractListProvider);

  return WalletConnectedNotifier(contractList: contractList);
});

class WalletConnectedNotifier extends StateNotifier<List<WalletInfo>> {
  final List<Stream_chicken_2> contractList;

  WalletConnectedNotifier({required this.contractList}) : super([]);

  bool get isWalletConnected => state.isNotEmpty;

  Future<void> addWallet(WalletInfo walletInfo) async {
    final bool haveSameWallet = state.where((element) => element.address == walletInfo.address).isNotEmpty;
    if (haveSameWallet) {
      return;
    }
    final bool alreadyHaveEthWallet = state.where((element) => element.isFromMetamask).isNotEmpty;
    if (alreadyHaveEthWallet) {
      return;
    }

    // 取得貨幣資料
    // final List<TokenInfo> tokenInfoList = _getTokenData(walletAddress: address);
    final List<TokenInfo> tokenInfoList = [
      TokenInfo(
        imgPath: 'assets/images/eth-token.png',
        name: 'ETH',
        amount: walletInfo.etherAmount,
      )
    ];
    // 取得NFT資料
    final List<NFTCollection> nftCollectionList =
        await _getNFTData(walletAddress: walletInfo.address, contractList: contractList);

    walletInfo.tokenInfoList = tokenInfoList;
    walletInfo.nftCollectionList = nftCollectionList;

    state.add(walletInfo);
  }

  void removeWallet(String walletAddress) {
    final WalletInfo? wallet = state.singleWhereOrNull((element) => element.address == walletAddress);
    if (wallet != null) {
      state.remove(wallet);
    }
  }

  Future<List<NFTCollection>> _getNFTData({
    required String walletAddress,
    required List<Stream_chicken_2> contractList,
  }) async {
    final List<NFTCollection> nftCollectionList = [];

    for (Stream_chicken_2 contract in contractList) {
      final String collectionName = await contract.name();
      NFTCollection collection = NFTCollection(
        name: collectionName,
        tokenName: collectionName,
        nftInfoList: List<NFTInfo>.generate(
          6,
          (int index) => NFTInfo(
            tokenId: index,
            imgPath: "assets/images/ck-${index + 1}.png",
            bgColor: bgColors[index % 3],
          ),
          growable: true,
        ),
      );

      nftCollectionList.add(collection);
    }

    return nftCollectionList;
  }

  List<TokenInfo> _getTokenData({required String walletAddress}) {
    final List<TokenInfo> tokenInfoList = [];
    return tokenInfoList;
  }

  final List<Color> bgColors = [
    CustomTheme.primaryColor,
    CustomTheme.secondColor,
    Colors.deepPurpleAccent,
  ];
}

/// 目前查看的錢包index
StateProvider<int> currentWalletIndexProvider = StateProvider<int>((ref) {
  return 0;
});

/// 目前查看的錢包index
Provider<WalletInfo> currentWalletProvider = Provider<WalletInfo>((ref) {
  final List<WalletInfo> walletList = ref.watch(walletConnectedProvider);
  final int currentIndex = ref.watch(currentWalletIndexProvider);
  return walletList[currentIndex];
});

///
StateProvider<List<String>> contractListAddressProvider = StateProvider<List<String>>((ref) {
  return [Constant.streamChickenContractAddress];
});

/// 直播雞2的abi，合約
/// 也代表目前標準的ERC 721合約，幾乎每個NFT項目都可以使用這個abi提供的方法去使用
Provider<List<Stream_chicken_2>> contractListProvider = Provider<List<Stream_chicken_2>>(
  (ref) {
    final List<String> contractAddressList = ref.read(contractListAddressProvider);
    final Web3Client web3client = ref.read(web3ClientProvider);

    final List<Stream_chicken_2> result = [];
    for (String ca in contractAddressList) {
      final EthereumAddress ethereumAddress = EthereumAddress.fromHex(ca);
      Stream_chicken_2 contract =
          Stream_chicken_2(address: ethereumAddress, client: web3client, chainId: Constant.rinkebyChainId);
      result.add(contract);
    }
    return result;
  },
);
