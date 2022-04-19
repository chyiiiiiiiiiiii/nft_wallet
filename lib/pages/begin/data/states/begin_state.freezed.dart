// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'begin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConnectWalletStateTearOff {
  const _$ConnectWalletStateTearOff();

  ConnectWalletInitial init() {
    return const ConnectWalletInitial();
  }

  ConnectWalletLoading loading() {
    return const ConnectWalletLoading();
  }

  ConnectWalletData data({required WalletInfo walletInfo}) {
    return ConnectWalletData(
      walletInfo: walletInfo,
    );
  }

  ConnectWalletError error({required String msg}) {
    return ConnectWalletError(
      msg: msg,
    );
  }
}

/// @nodoc
const $ConnectWalletState = _$ConnectWalletStateTearOff();

/// @nodoc
mixin _$ConnectWalletState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(WalletInfo walletInfo) data,
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(WalletInfo walletInfo)? data,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(WalletInfo walletInfo)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletInitial value) init,
    required TResult Function(ConnectWalletLoading value) loading,
    required TResult Function(ConnectWalletData value) data,
    required TResult Function(ConnectWalletError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ConnectWalletInitial value)? init,
    TResult Function(ConnectWalletLoading value)? loading,
    TResult Function(ConnectWalletData value)? data,
    TResult Function(ConnectWalletError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletInitial value)? init,
    TResult Function(ConnectWalletLoading value)? loading,
    TResult Function(ConnectWalletData value)? data,
    TResult Function(ConnectWalletError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectWalletStateCopyWith<$Res> {
  factory $ConnectWalletStateCopyWith(
          ConnectWalletState value, $Res Function(ConnectWalletState) then) =
      _$ConnectWalletStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConnectWalletStateCopyWithImpl<$Res>
    implements $ConnectWalletStateCopyWith<$Res> {
  _$ConnectWalletStateCopyWithImpl(this._value, this._then);

  final ConnectWalletState _value;
  // ignore: unused_field
  final $Res Function(ConnectWalletState) _then;
}

/// @nodoc
abstract class $ConnectWalletInitialCopyWith<$Res> {
  factory $ConnectWalletInitialCopyWith(ConnectWalletInitial value,
          $Res Function(ConnectWalletInitial) then) =
      _$ConnectWalletInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConnectWalletInitialCopyWithImpl<$Res>
    extends _$ConnectWalletStateCopyWithImpl<$Res>
    implements $ConnectWalletInitialCopyWith<$Res> {
  _$ConnectWalletInitialCopyWithImpl(
      ConnectWalletInitial _value, $Res Function(ConnectWalletInitial) _then)
      : super(_value, (v) => _then(v as ConnectWalletInitial));

  @override
  ConnectWalletInitial get _value => super._value as ConnectWalletInitial;
}

/// @nodoc

class _$ConnectWalletInitial implements ConnectWalletInitial {
  const _$ConnectWalletInitial();

  @override
  String toString() {
    return 'ConnectWalletState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ConnectWalletInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(WalletInfo walletInfo) data,
    required TResult Function(String msg) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(WalletInfo walletInfo)? data,
    TResult Function(String msg)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(WalletInfo walletInfo)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletInitial value) init,
    required TResult Function(ConnectWalletLoading value) loading,
    required TResult Function(ConnectWalletData value) data,
    required TResult Function(ConnectWalletError value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ConnectWalletInitial value)? init,
    TResult Function(ConnectWalletLoading value)? loading,
    TResult Function(ConnectWalletData value)? data,
    TResult Function(ConnectWalletError value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletInitial value)? init,
    TResult Function(ConnectWalletLoading value)? loading,
    TResult Function(ConnectWalletData value)? data,
    TResult Function(ConnectWalletError value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class ConnectWalletInitial implements ConnectWalletState {
  const factory ConnectWalletInitial() = _$ConnectWalletInitial;
}

/// @nodoc
abstract class $ConnectWalletLoadingCopyWith<$Res> {
  factory $ConnectWalletLoadingCopyWith(ConnectWalletLoading value,
          $Res Function(ConnectWalletLoading) then) =
      _$ConnectWalletLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConnectWalletLoadingCopyWithImpl<$Res>
    extends _$ConnectWalletStateCopyWithImpl<$Res>
    implements $ConnectWalletLoadingCopyWith<$Res> {
  _$ConnectWalletLoadingCopyWithImpl(
      ConnectWalletLoading _value, $Res Function(ConnectWalletLoading) _then)
      : super(_value, (v) => _then(v as ConnectWalletLoading));

  @override
  ConnectWalletLoading get _value => super._value as ConnectWalletLoading;
}

/// @nodoc

class _$ConnectWalletLoading implements ConnectWalletLoading {
  const _$ConnectWalletLoading();

  @override
  String toString() {
    return 'ConnectWalletState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ConnectWalletLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(WalletInfo walletInfo) data,
    required TResult Function(String msg) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(WalletInfo walletInfo)? data,
    TResult Function(String msg)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(WalletInfo walletInfo)? data,
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
    required TResult Function(ConnectWalletInitial value) init,
    required TResult Function(ConnectWalletLoading value) loading,
    required TResult Function(ConnectWalletData value) data,
    required TResult Function(ConnectWalletError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ConnectWalletInitial value)? init,
    TResult Function(ConnectWalletLoading value)? loading,
    TResult Function(ConnectWalletData value)? data,
    TResult Function(ConnectWalletError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletInitial value)? init,
    TResult Function(ConnectWalletLoading value)? loading,
    TResult Function(ConnectWalletData value)? data,
    TResult Function(ConnectWalletError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ConnectWalletLoading implements ConnectWalletState {
  const factory ConnectWalletLoading() = _$ConnectWalletLoading;
}

/// @nodoc
abstract class $ConnectWalletDataCopyWith<$Res> {
  factory $ConnectWalletDataCopyWith(
          ConnectWalletData value, $Res Function(ConnectWalletData) then) =
      _$ConnectWalletDataCopyWithImpl<$Res>;
  $Res call({WalletInfo walletInfo});
}

/// @nodoc
class _$ConnectWalletDataCopyWithImpl<$Res>
    extends _$ConnectWalletStateCopyWithImpl<$Res>
    implements $ConnectWalletDataCopyWith<$Res> {
  _$ConnectWalletDataCopyWithImpl(
      ConnectWalletData _value, $Res Function(ConnectWalletData) _then)
      : super(_value, (v) => _then(v as ConnectWalletData));

  @override
  ConnectWalletData get _value => super._value as ConnectWalletData;

  @override
  $Res call({
    Object? walletInfo = freezed,
  }) {
    return _then(ConnectWalletData(
      walletInfo: walletInfo == freezed
          ? _value.walletInfo
          : walletInfo // ignore: cast_nullable_to_non_nullable
              as WalletInfo,
    ));
  }
}

/// @nodoc

class _$ConnectWalletData implements ConnectWalletData {
  const _$ConnectWalletData({required this.walletInfo});

  @override
  final WalletInfo walletInfo;

  @override
  String toString() {
    return 'ConnectWalletState.data(walletInfo: $walletInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConnectWalletData &&
            const DeepCollectionEquality()
                .equals(other.walletInfo, walletInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(walletInfo));

  @JsonKey(ignore: true)
  @override
  $ConnectWalletDataCopyWith<ConnectWalletData> get copyWith =>
      _$ConnectWalletDataCopyWithImpl<ConnectWalletData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(WalletInfo walletInfo) data,
    required TResult Function(String msg) error,
  }) {
    return data(walletInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(WalletInfo walletInfo)? data,
    TResult Function(String msg)? error,
  }) {
    return data?.call(walletInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(WalletInfo walletInfo)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(walletInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectWalletInitial value) init,
    required TResult Function(ConnectWalletLoading value) loading,
    required TResult Function(ConnectWalletData value) data,
    required TResult Function(ConnectWalletError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ConnectWalletInitial value)? init,
    TResult Function(ConnectWalletLoading value)? loading,
    TResult Function(ConnectWalletData value)? data,
    TResult Function(ConnectWalletError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletInitial value)? init,
    TResult Function(ConnectWalletLoading value)? loading,
    TResult Function(ConnectWalletData value)? data,
    TResult Function(ConnectWalletError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class ConnectWalletData implements ConnectWalletState {
  const factory ConnectWalletData({required WalletInfo walletInfo}) =
      _$ConnectWalletData;

  WalletInfo get walletInfo;
  @JsonKey(ignore: true)
  $ConnectWalletDataCopyWith<ConnectWalletData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectWalletErrorCopyWith<$Res> {
  factory $ConnectWalletErrorCopyWith(
          ConnectWalletError value, $Res Function(ConnectWalletError) then) =
      _$ConnectWalletErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class _$ConnectWalletErrorCopyWithImpl<$Res>
    extends _$ConnectWalletStateCopyWithImpl<$Res>
    implements $ConnectWalletErrorCopyWith<$Res> {
  _$ConnectWalletErrorCopyWithImpl(
      ConnectWalletError _value, $Res Function(ConnectWalletError) _then)
      : super(_value, (v) => _then(v as ConnectWalletError));

  @override
  ConnectWalletError get _value => super._value as ConnectWalletError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(ConnectWalletError(
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConnectWalletError implements ConnectWalletError {
  const _$ConnectWalletError({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'ConnectWalletState.error(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConnectWalletError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  $ConnectWalletErrorCopyWith<ConnectWalletError> get copyWith =>
      _$ConnectWalletErrorCopyWithImpl<ConnectWalletError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(WalletInfo walletInfo) data,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(WalletInfo walletInfo)? data,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(WalletInfo walletInfo)? data,
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
    required TResult Function(ConnectWalletInitial value) init,
    required TResult Function(ConnectWalletLoading value) loading,
    required TResult Function(ConnectWalletData value) data,
    required TResult Function(ConnectWalletError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ConnectWalletInitial value)? init,
    TResult Function(ConnectWalletLoading value)? loading,
    TResult Function(ConnectWalletData value)? data,
    TResult Function(ConnectWalletError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectWalletInitial value)? init,
    TResult Function(ConnectWalletLoading value)? loading,
    TResult Function(ConnectWalletData value)? data,
    TResult Function(ConnectWalletError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ConnectWalletError implements ConnectWalletState {
  const factory ConnectWalletError({required String msg}) =
      _$ConnectWalletError;

  String get msg;
  @JsonKey(ignore: true)
  $ConnectWalletErrorCopyWith<ConnectWalletError> get copyWith =>
      throw _privateConstructorUsedError;
}
