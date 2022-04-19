import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web3dart/web3dart.dart';

import '../../../../core/provider/shared_provider.dart';
import '../../../../core/util/web3/wallet_connect_helper.dart';
import '../../data/models/wallet_info.dart';
import '../../data/states/begin_state.dart';
import '../../presentation/pages/home_page.dart';

final importWalletProvider = StateNotifierProvider.autoDispose<ImportWalletNotifier, ConnectWalletState>(
  (ref) {
    final Web3Client client = ref.read(web3ClientProvider);
    return ImportWalletNotifier(
      client: client,
    );
  },
);

class ImportWalletNotifier extends StateNotifier<ConnectWalletState> {
  final Web3Client client;

  bool isConnectWallet = false;

  ImportWalletNotifier({
    required this.client,
  }) : super(const ConnectWalletState.init());

  void showHomePage(context) {
    HomePage.show(context);
  }

  Future<void> importWallet() async {
    // state = const ConnectWalletState.loading();
    // isConnectWallet = true;
    // if (isConnectWallet) {
    //   String address = '';
    //   final EtherAmount etherAmount = EtherAmount.zero();
    //   final EthWallet wallet = EthWallet(
    //     address: address,
    //     importMethod: WalletImportMethod.metamask,
    //     ethers: etherAmount.getValueInUnit(EtherUnit.ether),
    //   );

    //   state = ConnectWalletState.data(wallet: wallet);
    // } else {
    //   state = const ConnectWalletState.error(msg: '無法匯入錢包，請再試一次');
    // }
  }
}

//--------------------------------

final connectWalletProvider = StateNotifierProvider.autoDispose<ConnectWalletNotifier, ConnectWalletState>(
  (ref) {
    final WalletConnectHelper helper = ref.read(wcHelperProvider);
    final Web3Client client = ref.read(web3ClientProvider);
    return ConnectWalletNotifier(
      helper: helper,
      client: client,
    );
  },
);

class ConnectWalletNotifier extends StateNotifier<ConnectWalletState> {
  final WalletConnectHelper helper;
  final Web3Client client;

  bool isConnectWallet = false;

  ConnectWalletNotifier({
    required this.helper,
    required this.client,
  }) : super(const ConnectWalletState.init());

  void showHomePage(context) {
    HomePage.show(context);
  }

  Future<void> connectWallet() async {
    state = const ConnectWalletState.loading();
    isConnectWallet = await helper.initSession();
    if (isConnectWallet) {
      String address = helper.getEthereumCredentials().getEthereumAddress().toString();
      final EtherAmount etherAmount = await client.getBalance(EthereumAddress.fromHex(address));
      final WalletInfo wallet = WalletInfo(
        address: address,
        importMethod: WalletImportMethod.metamask,
        etherAmount: etherAmount.getValueInUnit(EtherUnit.ether),
      );

      state = ConnectWalletState.data(walletInfo: wallet);
    } else {
      state = const ConnectWalletState.error(msg: '無法與錢包連結，請再試一次');
      state = const ConnectWalletState.init();
    }
  }
}
