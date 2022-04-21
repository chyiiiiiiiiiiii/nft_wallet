import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/wallet_info.dart';

part 'transfer_coin_state.freezed.dart';

@freezed
class TransferCoinState with _$TransferCoinState {
  const factory TransferCoinState.init() = TransferCoinInitial;
  const factory TransferCoinState.loading() = TransferCoinLoading;
  const factory TransferCoinState.data() = TransferCoinData;
  const factory TransferCoinState.error({required String msg}) = TransferCoinError;
}
