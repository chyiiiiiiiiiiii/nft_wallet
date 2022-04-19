class TokenInfo {
  final String imgPath;
  final String name;
  final double amount;

  TokenInfo({
    required this.imgPath,
    required this.name,
    required this.amount,
  });

  bool get isEther => name == 'ETH';
}
