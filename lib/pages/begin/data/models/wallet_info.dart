import 'nft_info.dart';
import 'token_info.dart';

enum WalletImportMethod { metamask, privateKey, local }

class WalletInfo {
  final String address;
  final WalletImportMethod importMethod;
  late final double etherAmount;

  /// 貨幣
  List<TokenInfo> tokenInfoList = [];

  /// NFT項目
  List<NFTCollection> nftCollectionList = [];

  WalletInfo({
    required this.address,
    required this.importMethod,
    required this.etherAmount,
  });

  bool get isFromMetamask => importMethod == WalletImportMethod.metamask;
  bool get isFromKey => importMethod == WalletImportMethod.privateKey;

  String getSourceImagePath() {
    if (isFromMetamask) {
      return 'assets/images/metamask-icon.png';
    } else if (isFromKey) {
      return 'assets/images/key-btn.png';
    }
    return '';
  }
}
