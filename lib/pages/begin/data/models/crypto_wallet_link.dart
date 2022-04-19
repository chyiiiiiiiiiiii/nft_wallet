class CryptoWalletLink {
  static const CryptoWalletLink metamask = CryptoWalletLink(
      universalLink: 'https://metamask.app.link/', deeplink: 'metamask://');
  static const CryptoWalletLink trustWallet = CryptoWalletLink(
      universalLink: 'https://link.trustwallet.com/', deeplink: 'trust://');
  static const CryptoWalletLink rainbowMe =
      CryptoWalletLink(universalLink: 'https://rainbow.me/', deeplink: 'rainbow://');
  static const CryptoWalletLink talken =
      CryptoWalletLink(universalLink: 'https://talken.io');

  /// universal link for iOS
  final String universalLink;

  /// deeplink for android
  final String? deeplink;

  const CryptoWalletLink({
    required this.universalLink,
    this.deeplink,
  });
}
