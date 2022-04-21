import 'dart:convert';
import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nft_wallet/core/util/web3/deeplink_util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web3dart/web3dart.dart';

import '../../../pages/begin/data/models/crypto_wallet_link.dart';
import '../../../pages/begin/data/models/nft_info.dart';
import '../../../pages/begin/data/models/token_info.dart';
import '../../../pages/begin/data/models/wallet_info.dart';
import '../../error/exceptions.dart';
import '../../provider/shared_provider.dart';
import '../theme.dart';
import 'WalletConnectEthereumCredentials.dart';
import 'abi/erc20.g.dart';
import 'abi/stream_chicken_2.g.dart';
import 'eth_conversions.dart';
import 'metamask_wallet_connect_helper.dart';

class WalletHelper {
  final ProviderRef ref;

  WalletHelper({required this.ref});

  /// 取得透過私鑰匯入的錢包Credentials
  /// 如果是Metamask取不到，因為沒有私鑰
  EthPrivateKey getEthPrivateKeyCredentials({required String privateKey}) {
    return EthPrivateKey.fromHex(privateKey);
  }

  Future<double> getEtherAmount({required final String walletAddress}) async {
    final Web3Client web3client = ref.read(web3ClientProvider);

    final EtherAmount etherAmount = await web3client.getBalance(EthereumAddress.fromHex(walletAddress));
    final double doubleAmount = etherAmount.getValueInUnit(EtherUnit.ether);

    return doubleAmount;
  }

  Future<List<TokenInfo>> getCoinTokenData({required final String walletAddress}) async {
    double etherAmount = await getEtherAmount(walletAddress: walletAddress);
    etherAmount = Decimal.parse(etherAmount.toString()).toDouble();
    final List<TokenInfo> tokenInfoList = [];

    // Ether
    final TokenInfo etherTokenInfo = TokenInfo(
      imgPath: 'assets/images/eth-token.png',
      name: 'ETH',
      amount: etherAmount,
    );
    tokenInfoList.add(etherTokenInfo);

    // Other Coin
    final List<Erc20> erc20ContractList = ref.read(coinContractListProvider);
    for (Erc20 contract in erc20ContractList) {
      final String coinName = await contract.name();
      double coinAmount = (await contract.balanceOf(EthereumAddress.fromHex(walletAddress))).toDecimal().toDouble();
      coinAmount = Decimal.parse(coinAmount.toString()).toDouble();

      final TokenInfo tokenInfo = TokenInfo(
        imgPath: 'assets/images/usdt-token.png',
        name: coinName,
        amount: coinAmount,
        contract: contract,
      );
      tokenInfoList.add(tokenInfo);
    }

    return tokenInfoList;
  }

  Future<List<NFTCollection>> getNFTData({required final String walletAddress}) async {
    final List<Stream_chicken_2> contractList = ref.read(nftContractListProvider);

    final List<NFTCollection> nftCollectionList = [];
    for (Stream_chicken_2 contract in contractList) {
      final NFTCollection collection = await _getNFTCollection(walletAddress: walletAddress, contract: contract);
      nftCollectionList.add(collection);
    }

    return nftCollectionList;
  }

  /// 取得NFT項目資料
  Future<NFTCollection> _getNFTCollection({
    required String walletAddress,
    required Stream_chicken_2 contract,
  }) async {
    // 項目名稱
    final String collectionName = await contract.name();

    // 錢包地址
    EthereumAddress myAddress = EthereumAddress.fromHex(walletAddress);
    // 此錢包擁有幾個此項目的NFT
    int ownAmount = (await contract.balanceOf(myAddress)).toInt();

    // 將查所有NFT，擁有者是我的錢包的話就記下來
    List<int> ownTokenIdList = [];
    int tokenId = 0;
    while (ownTokenIdList.length != ownAmount) {
      if (await contract.ownerOf(BigInt.from(tokenId)) == myAddress) {
        ownTokenIdList.add(tokenId);
      }
      tokenId++;
    }

    // 每個NFT的圖片資料
    List<String> nftImageUrlList = [];
    for (int tokenId in ownTokenIdList) {
      final String uri = await contract.tokenURI(BigInt.from(tokenId));

      final HttpClient httpClient = HttpClient();
      final HttpClientRequest res = await httpClient.getUrl(Uri.parse(uri));
      final HttpClientResponse response = await res.close();
      final String json = await response.transform(utf8.decoder).join();
      final Map data = jsonDecode(json);
      final String imgUrl = data['image'];

      nftImageUrlList.add(imgUrl);
    }

    // 擁有的NFT資訊
    List<NFTInfo> nftInfoList = List<NFTInfo>.generate(
      ownAmount,
      (int index) => NFTInfo(
        tokenId: ownTokenIdList[index],
        imgPath: nftImageUrlList[index],
        bgColor: CustomTheme.nftBgColors[index % 3],
      ),
      growable: true,
    );

    // NFT項目
    NFTCollection collection = NFTCollection(
      name: collectionName,
      tokenName: collectionName,
      nftInfoList: nftInfoList,
    );
    return collection;
  }

  /// 貨幣轉帳
  /// 回傳交易的hash，可以到鏈上查詢
  Future<String> transferCoin({
    required String toAddress,
    required num amount,
    TokenInfo? tokenInfo,
  }) async {
    String transactionHash = '';

    final WalletInfo? walletInfo = ref.read(currentWalletProvider);
    if (walletInfo == null) {
      throw Web3Exception(msg: '錢包有問題，無法進行轉帳');
    }

    late EthereumAddress fromEthereumAddress;
    late EthereumAddress toEthereumAddress;
    try {
      fromEthereumAddress = EthereumAddress.fromHex(walletInfo.address);
      toEthereumAddress = EthereumAddress.fromHex(toAddress);
    } catch (e) {
      throw Web3Exception(msg: '錢包的地址格式有問題，無法進行轉帳');
    }

    BigInt weiBiAmount = EthConversions.ethToWeiBi(amount);

    try {
      if (tokenInfo == null) {
        // 以太幣
        if (walletInfo.isFromMetamask) {
          // 連結錢包轉帳
          transactionHash = await _transferEther(
            fromEthereumAddress: fromEthereumAddress,
            toEthereumAddress: toEthereumAddress,
            amount: weiBiAmount,
          );
        } else {
          // 透過錢包私鑰轉帳

        }
      } else {
        // 其他貨幣
        Erc20? erc20Contract = tokenInfo.contract;
        if (erc20Contract != null) {
          late Credentials credentials;
          if (walletInfo.isFromMetamask) {
            // Metamask
            await DeeplinkUtil.openMetamask();

            final MetamaskWalletConnectHelper helper = ref.read(metamaskWalletConnectHelperProvider);
            credentials = helper.getEthereumCredentials();
          } else {
            // PrivateKey
            credentials = getEthPrivateKeyCredentials(privateKey: walletInfo.privateKey);
          }

          transactionHash = await erc20Contract.transfer(
            toEthereumAddress,
            weiBiAmount,
            credentials: credentials,
            transaction: Transaction(
              from: fromEthereumAddress,
              to: toEthereumAddress,
              value: EtherAmount.zero(),
            ),
          );
        } else {
          throw Web3Exception(msg: '貨幣合約有問題，無法進行轉帳');
        }
      }
    } catch (e) {
      throw Web3Exception(msg: '轉帳有問題，請稍候再試試');
    }

    return transactionHash;
  }

  Future<String> _transferEther({
    required EthereumAddress fromEthereumAddress,
    required EthereumAddress toEthereumAddress,
    required BigInt amount,
  }) async {
    final MetamaskWalletConnectHelper helper = ref.read(metamaskWalletConnectHelperProvider);
    WalletConnectEthereumCredentials credentials = helper.getEthereumCredentials();
    final Web3Client web3client = ref.read(web3ClientProvider);

    Transaction transaction = Transaction(
      from: fromEthereumAddress,
      to: toEthereumAddress,
      value: EtherAmount.fromUnitAndValue(
        EtherUnit.wei,
        amount,
      ),
    );

    await DeeplinkUtil.openMetamask();
    final String transactionHash = await web3client.sendTransaction(credentials, transaction);

    return transactionHash;
  }
}
