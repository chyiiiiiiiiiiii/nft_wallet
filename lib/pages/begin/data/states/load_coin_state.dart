import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/token_info.dart';

part 'load_coin_state.freezed.dart';

@freezed
class LoadCoinState with _$LoadCoinState {
  const factory LoadCoinState.init() = LoadCoinInitial;
  const factory LoadCoinState.loading() = LoadCoinLoading;
  const factory LoadCoinState.data({required List<TokenInfo> tokenInfoList}) = LoadCoinData;
  const factory LoadCoinState.error({required String msg}) = LoadCoinError;
}
