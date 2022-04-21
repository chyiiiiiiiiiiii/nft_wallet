import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/provider/shared_provider.dart';
import '../../../../core/util/web3/metamask_wallet_connect_helper.dart';
import '../../../../core/util/web3/wallet_helper.dart';
import '../../data/models/wallet_info.dart';
import '../../data/states/begin_state.dart';
import '../../presentation/pages/home_page.dart';

final StateNotifierProvider<ConnectWalletNotifier, ConnectWalletState> connectWalletProvider =
    StateNotifierProvider<ConnectWalletNotifier, ConnectWalletState>(
  (ref) {
    final MetamaskWalletConnectHelper walletConnectHelper = ref.read(metamaskWalletConnectHelperProvider);
    final WalletHelper walletHelper = ref.read(walletHelperProvider);

    return ConnectWalletNotifier(
      walletConnectHelper: walletConnectHelper,
      walletHelper: walletHelper,
    );
  },
);

class ConnectWalletNotifier extends StateNotifier<ConnectWalletState> {
  final MetamaskWalletConnectHelper walletConnectHelper;
  final WalletHelper walletHelper;

  bool isConnectWallet = false;

  ConnectWalletNotifier({
    required this.walletConnectHelper,
    required this.walletHelper,
  }) : super(const ConnectWalletState.init());

  void showHomePage(context) {
    HomePage.show(context);
  }

  Future<void> connectWallet() async {
    state = const ConnectWalletState.loading();
    isConnectWallet = await walletConnectHelper.initSession();
    if (isConnectWallet) {
      final String address = walletConnectHelper.getEthereumCredentials().getEthereumAddress().toString();

      final WalletInfo wallet = WalletInfo(
        address: address,
        importMethod: WalletImportMethod.metamask,
      );

      state = ConnectWalletState.data(walletInfo: wallet);
    } else {
      state = const ConnectWalletState.error(msg: '無法與錢包連結，請再試一次');
      state = const ConnectWalletState.init();
    }
  }
}
