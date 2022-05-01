import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../../pages/begin/data/models/app_info.dart';
import '../../pages/begin/data/models/wallet_info.dart';
import '../../pages/begin/data/states/begin_state.dart';
import '../../pages/begin/data/states/load_coin_state.dart';
import '../../pages/begin/data/states/load_nft_state.dart';
import '../util/constant.dart';
import '../util/web3/abi/erc20.g.dart';
import '../util/web3/abi/stream_chicken_2.g.dart';
import '../util/web3/metamask_wallet_connect_helper.dart';
import '../util/web3/wallet_helper.dart';

/// Web3Client - 操作合約
Provider<Web3Client> web3ClientProvider = Provider<Web3Client>((ref) {
  Web3Client web3client = Web3Client(MetamaskWalletConnectHelper.ethRinkebyTestnetEndpoints, Client());
  return web3client;
});

/// 連結錢包的工具類
Provider<MetamaskWalletConnectHelper> metamaskWalletConnectHelperProvider = Provider<MetamaskWalletConnectHelper>(
  (ref) {
    final MetamaskWalletConnectHelper walletConnectHelper = MetamaskWalletConnectHelper(
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
final walletConnectedProvider = StateNotifierProvider<WalletConnectedNotifier, List<WalletInfo>>((ref) {
  final Web3Client web3client = ref.read(web3ClientProvider);
  return WalletConnectedNotifier(web3client: web3client);
});

class WalletConnectedNotifier extends StateNotifier<List<WalletInfo>> {
  final Web3Client web3client;
  WalletConnectedNotifier({required this.web3client}) : super([]);

  /// 是否有連結錢包
  bool get isWalletConnected => state.isNotEmpty;

  Future<void> addWallet(WalletInfo walletInfo) async {
    final bool haveSameWallet = state.where((element) => element.address == walletInfo.address).isNotEmpty;
    if (haveSameWallet) {
      Fluttertoast.showToast(msg: '此錢包已匯入過囉');
      return;
    }

    // 檢查是不是已經有從Metamask連結過的錢包，有的話其他只能透過私鑰匯入
    final bool alreadyHaveEthWallet = state.where((element) => element.isFromMetamask).isNotEmpty;
    if (alreadyHaveEthWallet && walletInfo.isFromMetamask) {
      return;
    }

    // 錢包地址
    final String walletAddress = walletInfo.address;
    // 取得以太幣餘額
    final EtherAmount etherAmount = await web3client.getBalance(EthereumAddress.fromHex(walletAddress));
    final double doubleAmount = etherAmount.getValueInUnit(EtherUnit.ether);
    walletInfo.etherAmount = doubleAmount;

    state = [...state, walletInfo];
  }

  void removeWallet(String walletAddress) {
    final WalletInfo? wallet = state.singleWhereOrNull((element) => element.address == walletAddress);
    if (wallet != null) {
      state.remove(wallet);
    }
  }
}

/// 刷新錢包的貨幣資料
final loadCoinDataProvider = StateNotifierProvider.autoDispose<LoadCoinDataNotifier, LoadCoinState>((ref) {
  WalletConnectedNotifier walletConnectedNotifier = ref.watch(walletConnectedProvider.notifier);
  WalletHelper walletHelper = ref.watch(walletHelperProvider);
  String currentWalletAddress = ref.watch(currentWalletProvider)?.address ?? '';

  return LoadCoinDataNotifier(
    walletConnectedNotifier: walletConnectedNotifier,
    walletHelper: walletHelper,
    currentWalletAddress: currentWalletAddress,
  );
});

class LoadCoinDataNotifier extends StateNotifier<LoadCoinState> {
  final WalletConnectedNotifier walletConnectedNotifier;
  final WalletHelper walletHelper;
  final String currentWalletAddress;

  LoadCoinDataNotifier({
    required this.walletConnectedNotifier,
    required this.walletHelper,
    required this.currentWalletAddress,
  }) : super(const LoadCoinState.init());

  /// 刷新錢包資料
  Future<void> loadCoinData() async {
    state = const LoadCoinState.loading();
    try {
      final List<WalletInfo> walletInfoList = walletConnectedNotifier.state;
      for (WalletInfo walletInfo in walletInfoList) {
        if (walletInfo.address == currentWalletAddress) {
          final String walletAddress = walletInfo.address;
          walletInfo.etherAmount = await walletHelper.getEtherAmount(walletAddress: walletAddress);
          walletInfo.tokenInfoList = await walletHelper.getCoinTokenData(walletAddress: walletAddress);

          state = LoadCoinState.data(tokenInfoList: walletInfo.tokenInfoList);

          break;
        }
      }

      // 更新已連結的錢包資料、UI
      walletConnectedNotifier.state = [...walletInfoList];
    } catch (e) {
      state = const LoadCoinState.error(msg: 'loadCoinData() - error');
    }
  }
}

/// 刷新錢包的NFT資料
final loadNFTDataProvider = StateNotifierProvider.autoDispose<LoadNFTDataNotifier, LoadNFTState>((ref) {
  WalletConnectedNotifier walletConnectedNotifier = ref.watch(walletConnectedProvider.notifier);
  WalletHelper walletHelper = ref.watch(walletHelperProvider);
  String currentWalletAddress = ref.watch(currentWalletProvider)?.address ?? '';

  return LoadNFTDataNotifier(
    walletConnectedNotifier: walletConnectedNotifier,
    walletHelper: walletHelper,
    currentWalletAddress: currentWalletAddress,
  );
});

class LoadNFTDataNotifier extends StateNotifier<LoadNFTState> {
  final WalletConnectedNotifier walletConnectedNotifier;
  final WalletHelper walletHelper;
  final String currentWalletAddress;

  LoadNFTDataNotifier({
    required this.walletConnectedNotifier,
    required this.walletHelper,
    required this.currentWalletAddress,
  }) : super(const LoadNFTState.init());

  /// 刷新錢包資料
  Future<void> loadNFTData() async {
    state = const LoadNFTState.loading();
    try {
      final List<WalletInfo> walletInfoList = walletConnectedNotifier.state;
      for (WalletInfo walletInfo in walletInfoList) {
        if (walletInfo.address == currentWalletAddress) {
          final String walletAddress = walletInfo.address;
          walletInfo.nftCollectionList = await walletHelper.getNFTData(walletAddress: walletAddress);

          state = LoadNFTState.data(nftCollectionList: walletInfo.nftCollectionList);

          break;
        }
      }

      // 更新已連結的錢包資料、UI
      walletConnectedNotifier.state = walletInfoList;
    } catch (e) {
      state = const LoadNFTState.error(msg: 'loadCoinData() - error');
    }
  }
}

/// 目前查看的錢包index
StateProvider<int> currentWalletIndexProvider = StateProvider<int>((ref) {
  return 0;
});

/// 目前查看的錢包index
Provider<WalletInfo?> currentWalletProvider = Provider<WalletInfo?>((ref) {
  final List<WalletInfo> walletList = ref.watch(walletConnectedProvider);
  final int currentIndex = ref.watch(currentWalletIndexProvider);
  final WalletInfo? walletInfo = walletList.isNotEmpty ? walletList[currentIndex] : null;
  return walletInfo;
});

/// 目前支援的ERC20合約地址，貨幣
StateProvider<List<String>> coinContractAddressListProvider = StateProvider<List<String>>((ref) {
  return [
    Constant.usdtContractAddress,
  ];
});

/// 支援的ERC20合約清單，貨幣
/// 使用USDT的abi，也代表標準的ERC20合約，幾乎每個NFT項目都可以使用這個abi提供的方法去操作
final coinContractListProvider = Provider<List<Erc20>>(
  (ref) {
    final List<String> contractAddressList = ref.watch(coinContractAddressListProvider);
    final Web3Client web3client = ref.read(web3ClientProvider);

    final List<Erc20> result = [];
    for (String contractAddress in contractAddressList) {
      final EthereumAddress ethereumAddress = EthereumAddress.fromHex(contractAddress);
      Erc20 erc20Contract = Erc20(address: ethereumAddress, client: web3client, chainId: 4);
      result.add(erc20Contract);
    }

    return result;
  },
);

/// 目前支援的ERC721合約地址，NFT
StateProvider<List<String>> nftContractAddressListProvider = StateProvider<List<String>>((ref) {
  return [
    Constant.streamChickenContractAddress,
  ];
});

/// 支援的ERC721合約清單，NFT項目
/// 使用直播雞2的abi，也代表標準的ERC721合約，幾乎每個NFT項目都可以使用這個abi提供的方法去操作
Provider<List<Stream_chicken_2>> nftContractListProvider = Provider<List<Stream_chicken_2>>(
  (ref) {
    final List<String> contractAddressList = ref.watch(nftContractAddressListProvider);
    final Web3Client web3client = ref.read(web3ClientProvider);

    final List<Stream_chicken_2> result = [];
    for (String contractAddress in contractAddressList) {
      final EthereumAddress ethereumAddress = EthereumAddress.fromHex(contractAddress);
      Stream_chicken_2 contract = Stream_chicken_2(
        address: ethereumAddress,
        client: web3client,
        chainId: Constant.rinkebyChainId,
      );
      result.add(contract);
    }

    return result;
  },
);

/// 錢包幫手
Provider<WalletHelper> walletHelperProvider = Provider<WalletHelper>((ref) {
  return WalletHelper(ref: ref);
});

/// 匯入錢包、匯入PrivateKey
final importWalletProvider = StateNotifierProvider<ImportWalletNotifier, ConnectWalletState>(
  (ref) {
    final Web3Client client = ref.read(web3ClientProvider);
    final WalletConnectedNotifier walletConnectedNotifier = ref.watch(walletConnectedProvider.notifier);
    return ImportWalletNotifier(
      client: client,
      walletConnectedNotifier: walletConnectedNotifier,
    );
  },
);

class ImportWalletNotifier extends StateNotifier<ConnectWalletState> {
  final Web3Client client;
  final WalletConnectedNotifier walletConnectedNotifier;

  bool isConnectWallet = false;

  ImportWalletNotifier({
    required this.client,
    required this.walletConnectedNotifier,
  }) : super(const ConnectWalletState.init());

  Future<void> importWallet({required String privateKey}) async {
    state = const ConnectWalletState.loading();

    try {
      final EthPrivateKey ethPrivateKey = EthPrivateKey.fromHex(privateKey);
      final EthereumAddress address = await ethPrivateKey.extractAddress();
      isConnectWallet = true;

      final WalletInfo walletInfo = WalletInfo(
        address: address.toString(),
        importMethod: WalletImportMethod.privateKey,
        privateKey: privateKey,
      );

      walletConnectedNotifier.addWallet(walletInfo);
      state = ConnectWalletState.data(walletInfo: walletInfo);
    } catch (e) {
      isConnectWallet = false;
      const String msg = '無法匯入錢包，請再試一次';

      Fluttertoast.showToast(msg: msg);
      state = const ConnectWalletState.error(msg: msg);
      state = const ConnectWalletState.init();
    }
  }
}
