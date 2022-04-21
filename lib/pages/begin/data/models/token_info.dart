import '../../../../core/util/web3/abi/erc20.g.dart';

class TokenInfo {
  final String imgPath;
  final String name;
  final double amount;
  Erc20? contract;

  TokenInfo({
    required this.imgPath,
    required this.name,
    required this.amount,
    this.contract,
  });

  bool get isEther => name == 'ETH';

  String getCoinImagePath() {
    if (isEther) {
      return 'assets/images/eth-token.png';
    } else {
      return 'assets/images/usdt-token.png';
    }
  }
}
