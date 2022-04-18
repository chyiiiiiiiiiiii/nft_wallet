// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

  _UserStateInitial initial() {
    return const _UserStateInitial();
  }

  _UserStateLoading loading() {
    return const _UserStateLoading();
  }

  _UserStateData data({required User user}) {
    return _UserStateData(
      user: user,
    );
  }

  _UserStateError error({required String msg}) {
    return _UserStateError(
      msg: msg,
    );
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) data,
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? data,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserStateInitial value) initial,
    required TResult Function(_UserStateLoading value) loading,
    required TResult Function(_UserStateData value) data,
    required TResult Function(_UserStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UserStateInitial value)? initial,
    TResult Function(_UserStateLoading value)? loading,
    TResult Function(_UserStateData value)? data,
    TResult Function(_UserStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserStateInitial value)? initial,
    TResult Function(_UserStateLoading value)? loading,
    TResult Function(_UserStateData value)? data,
    TResult Function(_UserStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class _$UserStateInitialCopyWith<$Res> {
  factory _$UserStateInitialCopyWith(
          _UserStateInitial value, $Res Function(_UserStateInitial) then) =
      __$UserStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$UserStateInitialCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements _$UserStateInitialCopyWith<$Res> {
  __$UserStateInitialCopyWithImpl(
      _UserStateInitial _value, $Res Function(_UserStateInitial) _then)
      : super(_value, (v) => _then(v as _UserStateInitial));

  @override
  _UserStateInitial get _value => super._value as _UserStateInitial;
}

/// @nodoc

class _$_UserStateInitial implements _UserStateInitial {
  const _$_UserStateInitial();

  @override
  String toString() {
    return 'UserState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UserStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) data,
    required TResult Function(String msg) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? data,
    TResult Function(String msg)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserStateInitial value) initial,
    required TResult Function(_UserStateLoading value) loading,
    required TResult Function(_UserStateData value) data,
    required TResult Function(_UserStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UserStateInitial value)? initial,
    TResult Function(_UserStateLoading value)? loading,
    TResult Function(_UserStateData value)? data,
    TResult Function(_UserStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserStateInitial value)? initial,
    TResult Function(_UserStateLoading value)? loading,
    TResult Function(_UserStateData value)? data,
    TResult Function(_UserStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _UserStateInitial implements UserState {
  const factory _UserStateInitial() = _$_UserStateInitial;
}

/// @nodoc
abstract class _$UserStateLoadingCopyWith<$Res> {
  factory _$UserStateLoadingCopyWith(
          _UserStateLoading value, $Res Function(_UserStateLoading) then) =
      __$UserStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$UserStateLoadingCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements _$UserStateLoadingCopyWith<$Res> {
  __$UserStateLoadingCopyWithImpl(
      _UserStateLoading _value, $Res Function(_UserStateLoading) _then)
      : super(_value, (v) => _then(v as _UserStateLoading));

  @override
  _UserStateLoading get _value => super._value as _UserStateLoading;
}

/// @nodoc

class _$_UserStateLoading implements _UserStateLoading {
  const _$_UserStateLoading();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UserStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) data,
    required TResult Function(String msg) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? data,
    TResult Function(String msg)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserStateInitial value) initial,
    required TResult Function(_UserStateLoading value) loading,
    required TResult Function(_UserStateData value) data,
    required TResult Function(_UserStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UserStateInitial value)? initial,
    TResult Function(_UserStateLoading value)? loading,
    TResult Function(_UserStateData value)? data,
    TResult Function(_UserStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserStateInitial value)? initial,
    TResult Function(_UserStateLoading value)? loading,
    TResult Function(_UserStateData value)? data,
    TResult Function(_UserStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _UserStateLoading implements UserState {
  const factory _UserStateLoading() = _$_UserStateLoading;
}

/// @nodoc
abstract class _$UserStateDataCopyWith<$Res> {
  factory _$UserStateDataCopyWith(
          _UserStateData value, $Res Function(_UserStateData) then) =
      __$UserStateDataCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class __$UserStateDataCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$UserStateDataCopyWith<$Res> {
  __$UserStateDataCopyWithImpl(
      _UserStateData _value, $Res Function(_UserStateData) _then)
      : super(_value, (v) => _then(v as _UserStateData));

  @override
  _UserStateData get _value => super._value as _UserStateData;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_UserStateData(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_UserStateData implements _UserStateData {
  const _$_UserStateData({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'UserState.data(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserStateData &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$UserStateDataCopyWith<_UserStateData> get copyWith =>
      __$UserStateDataCopyWithImpl<_UserStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) data,
    required TResult Function(String msg) error,
  }) {
    return data(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? data,
    TResult Function(String msg)? error,
  }) {
    return data?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserStateInitial value) initial,
    required TResult Function(_UserStateLoading value) loading,
    required TResult Function(_UserStateData value) data,
    required TResult Function(_UserStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UserStateInitial value)? initial,
    TResult Function(_UserStateLoading value)? loading,
    TResult Function(_UserStateData value)? data,
    TResult Function(_UserStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserStateInitial value)? initial,
    TResult Function(_UserStateLoading value)? loading,
    TResult Function(_UserStateData value)? data,
    TResult Function(_UserStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _UserStateData implements UserState {
  const factory _UserStateData({required User user}) = _$_UserStateData;

  User get user;
  @JsonKey(ignore: true)
  _$UserStateDataCopyWith<_UserStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UserStateErrorCopyWith<$Res> {
  factory _$UserStateErrorCopyWith(
          _UserStateError value, $Res Function(_UserStateError) then) =
      __$UserStateErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$UserStateErrorCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$UserStateErrorCopyWith<$Res> {
  __$UserStateErrorCopyWithImpl(
      _UserStateError _value, $Res Function(_UserStateError) _then)
      : super(_value, (v) => _then(v as _UserStateError));

  @override
  _UserStateError get _value => super._value as _UserStateError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_UserStateError(
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserStateError implements _UserStateError {
  const _$_UserStateError({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'UserState.error(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserStateError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$UserStateErrorCopyWith<_UserStateError> get copyWith =>
      __$UserStateErrorCopyWithImpl<_UserStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) data,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? data,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserStateInitial value) initial,
    required TResult Function(_UserStateLoading value) loading,
    required TResult Function(_UserStateData value) data,
    required TResult Function(_UserStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UserStateInitial value)? initial,
    TResult Function(_UserStateLoading value)? loading,
    TResult Function(_UserStateData value)? data,
    TResult Function(_UserStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserStateInitial value)? initial,
    TResult Function(_UserStateLoading value)? loading,
    TResult Function(_UserStateData value)? data,
    TResult Function(_UserStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _UserStateError implements UserState {
  const factory _UserStateError({required String msg}) = _$_UserStateError;

  String get msg;
  @JsonKey(ignore: true)
  _$UserStateErrorCopyWith<_UserStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
