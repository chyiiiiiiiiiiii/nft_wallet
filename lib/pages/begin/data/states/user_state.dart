import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/user.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  ///Initial
  const factory UserState.initial() = _UserStateInitial;

  ///Loading
  const factory UserState.loading() = _UserStateLoading;

  ///Data
  const factory UserState.data({required User user}) = _UserStateData;

  ///Error
  const factory UserState.error({required String msg}) = _UserStateError;
}
