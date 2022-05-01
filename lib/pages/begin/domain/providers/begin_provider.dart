import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/provider/shared_provider.dart';
import '../../../../core/util/web3/metamask_wallet_connect_helper.dart';
import '../../../../core/util/web3/wallet_helper.dart';
import '../../data/models/wallet_info.dart';
import '../../data/states/begin_state.dart';

final StateNotifierProvider<ConnectWalletNotifier, ConnectWalletState> connectWalletProvider =
    StateNotifierProvider<ConnectWalletNotifier, ConnectWalletState>(
  (ref) {
    final MetamaskWalletConnectHelper walletConnectHelper = ref.read(metamaskWalletConnectHelperProvider);
    final WalletConnectedNotifier walletConnectedNotifier = ref.watch(walletConnectedProvider.notifier);
    final WalletHelper walletHelper = ref.read(walletHelperProvider);

    return ConnectWalletNotifier(
      walletConnectHelper: walletConnectHelper,
      walletConnectedNotifier: walletConnectedNotifier,
      walletHelper: walletHelper,
    );
  },
);

class ConnectWalletNotifier extends StateNotifier<ConnectWalletState> {
  final MetamaskWalletConnectHelper walletConnectHelper;
  final WalletConnectedNotifier walletConnectedNotifier;
  final WalletHelper walletHelper;

  bool isConnectWallet = false;

  ConnectWalletNotifier({
    required this.walletConnectHelper,
    required this.walletConnectedNotifier,
    required this.walletHelper,
  }) : super(const ConnectWalletState.init());

  Future<void> connectWallet() async {
    state = const ConnectWalletState.loading();
    isConnectWallet = await walletConnectHelper.initSession();
    if (isConnectWallet) {
      final String address = walletConnectHelper.getEthereumCredentials().getEthereumAddress().toString();
      isConnectWallet = true;

      final WalletInfo walletInfo = WalletInfo(
        address: address,
        importMethod: WalletImportMethod.metamask,
      );

      walletConnectedNotifier.addWallet(walletInfo);
      state = ConnectWalletState.data(walletInfo: walletInfo);
    } else {
      isConnectWallet = false;
      const String msg = '無法與錢包連結，請再試一次';

      Fluttertoast.showToast(msg: msg);
      state = const ConnectWalletState.error(msg: msg);
      state = const ConnectWalletState.init();
    }
  }
}
