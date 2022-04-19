import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/wallet_info.dart';

part 'begin_state.freezed.dart';

@freezed
class ConnectWalletState with _$ConnectWalletState {
  const factory ConnectWalletState.init() = ConnectWalletInitial;
  const factory ConnectWalletState.loading() = ConnectWalletLoading;
  const factory ConnectWalletState.data({required WalletInfo walletInfo}) = ConnectWalletData;
  const factory ConnectWalletState.error({required String msg}) = ConnectWalletError;
}
