// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'load_coin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoadCoinStateTearOff {
  const _$LoadCoinStateTearOff();

  LoadCoinInitial init() {
    return const LoadCoinInitial();
  }

  LoadCoinLoading loading() {
    return const LoadCoinLoading();
  }

  LoadCoinData data({required List<TokenInfo> tokenInfoList}) {
    return LoadCoinData(
      tokenInfoList: tokenInfoList,
    );
  }

  LoadCoinError error({required String msg}) {
    return LoadCoinError(
      msg: msg,
    );
  }
}

/// @nodoc
const $LoadCoinState = _$LoadCoinStateTearOff();

/// @nodoc
mixin _$LoadCoinState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(List<TokenInfo> tokenInfoList) data,
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<TokenInfo> tokenInfoList)? data,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<TokenInfo> tokenInfoList)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCoinInitial value) init,
    required TResult Function(LoadCoinLoading value) loading,
    required TResult Function(LoadCoinData value) data,
    required TResult Function(LoadCoinError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCoinInitial value)? init,
    TResult Function(LoadCoinLoading value)? loading,
    TResult Function(LoadCoinData value)? data,
    TResult Function(LoadCoinError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCoinInitial value)? init,
    TResult Function(LoadCoinLoading value)? loading,
    TResult Function(LoadCoinData value)? data,
    TResult Function(LoadCoinError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadCoinStateCopyWith<$Res> {
  factory $LoadCoinStateCopyWith(
          LoadCoinState value, $Res Function(LoadCoinState) then) =
      _$LoadCoinStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadCoinStateCopyWithImpl<$Res>
    implements $LoadCoinStateCopyWith<$Res> {
  _$LoadCoinStateCopyWithImpl(this._value, this._then);

  final LoadCoinState _value;
  // ignore: unused_field
  final $Res Function(LoadCoinState) _then;
}

/// @nodoc
abstract class $LoadCoinInitialCopyWith<$Res> {
  factory $LoadCoinInitialCopyWith(
          LoadCoinInitial value, $Res Function(LoadCoinInitial) then) =
      _$LoadCoinInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadCoinInitialCopyWithImpl<$Res>
    extends _$LoadCoinStateCopyWithImpl<$Res>
    implements $LoadCoinInitialCopyWith<$Res> {
  _$LoadCoinInitialCopyWithImpl(
      LoadCoinInitial _value, $Res Function(LoadCoinInitial) _then)
      : super(_value, (v) => _then(v as LoadCoinInitial));

  @override
  LoadCoinInitial get _value => super._value as LoadCoinInitial;
}

/// @nodoc

class _$LoadCoinInitial implements LoadCoinInitial {
  const _$LoadCoinInitial();

  @override
  String toString() {
    return 'LoadCoinState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadCoinInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(List<TokenInfo> tokenInfoList) data,
    required TResult Function(String msg) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<TokenInfo> tokenInfoList)? data,
    TResult Function(String msg)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<TokenInfo> tokenInfoList)? data,
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
    required TResult Function(LoadCoinInitial value) init,
    required TResult Function(LoadCoinLoading value) loading,
    required TResult Function(LoadCoinData value) data,
    required TResult Function(LoadCoinError value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCoinInitial value)? init,
    TResult Function(LoadCoinLoading value)? loading,
    TResult Function(LoadCoinData value)? data,
    TResult Function(LoadCoinError value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCoinInitial value)? init,
    TResult Function(LoadCoinLoading value)? loading,
    TResult Function(LoadCoinData value)? data,
    TResult Function(LoadCoinError value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class LoadCoinInitial implements LoadCoinState {
  const factory LoadCoinInitial() = _$LoadCoinInitial;
}

/// @nodoc
abstract class $LoadCoinLoadingCopyWith<$Res> {
  factory $LoadCoinLoadingCopyWith(
          LoadCoinLoading value, $Res Function(LoadCoinLoading) then) =
      _$LoadCoinLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadCoinLoadingCopyWithImpl<$Res>
    extends _$LoadCoinStateCopyWithImpl<$Res>
    implements $LoadCoinLoadingCopyWith<$Res> {
  _$LoadCoinLoadingCopyWithImpl(
      LoadCoinLoading _value, $Res Function(LoadCoinLoading) _then)
      : super(_value, (v) => _then(v as LoadCoinLoading));

  @override
  LoadCoinLoading get _value => super._value as LoadCoinLoading;
}

/// @nodoc

class _$LoadCoinLoading implements LoadCoinLoading {
  const _$LoadCoinLoading();

  @override
  String toString() {
    return 'LoadCoinState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadCoinLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(List<TokenInfo> tokenInfoList) data,
    required TResult Function(String msg) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<TokenInfo> tokenInfoList)? data,
    TResult Function(String msg)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<TokenInfo> tokenInfoList)? data,
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
    required TResult Function(LoadCoinInitial value) init,
    required TResult Function(LoadCoinLoading value) loading,
    required TResult Function(LoadCoinData value) data,
    required TResult Function(LoadCoinError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCoinInitial value)? init,
    TResult Function(LoadCoinLoading value)? loading,
    TResult Function(LoadCoinData value)? data,
    TResult Function(LoadCoinError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCoinInitial value)? init,
    TResult Function(LoadCoinLoading value)? loading,
    TResult Function(LoadCoinData value)? data,
    TResult Function(LoadCoinError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadCoinLoading implements LoadCoinState {
  const factory LoadCoinLoading() = _$LoadCoinLoading;
}

/// @nodoc
abstract class $LoadCoinDataCopyWith<$Res> {
  factory $LoadCoinDataCopyWith(
          LoadCoinData value, $Res Function(LoadCoinData) then) =
      _$LoadCoinDataCopyWithImpl<$Res>;
  $Res call({List<TokenInfo> tokenInfoList});
}

/// @nodoc
class _$LoadCoinDataCopyWithImpl<$Res> extends _$LoadCoinStateCopyWithImpl<$Res>
    implements $LoadCoinDataCopyWith<$Res> {
  _$LoadCoinDataCopyWithImpl(
      LoadCoinData _value, $Res Function(LoadCoinData) _then)
      : super(_value, (v) => _then(v as LoadCoinData));

  @override
  LoadCoinData get _value => super._value as LoadCoinData;

  @override
  $Res call({
    Object? tokenInfoList = freezed,
  }) {
    return _then(LoadCoinData(
      tokenInfoList: tokenInfoList == freezed
          ? _value.tokenInfoList
          : tokenInfoList // ignore: cast_nullable_to_non_nullable
              as List<TokenInfo>,
    ));
  }
}

/// @nodoc

class _$LoadCoinData implements LoadCoinData {
  const _$LoadCoinData({required this.tokenInfoList});

  @override
  final List<TokenInfo> tokenInfoList;

  @override
  String toString() {
    return 'LoadCoinState.data(tokenInfoList: $tokenInfoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadCoinData &&
            const DeepCollectionEquality()
                .equals(other.tokenInfoList, tokenInfoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(tokenInfoList));

  @JsonKey(ignore: true)
  @override
  $LoadCoinDataCopyWith<LoadCoinData> get copyWith =>
      _$LoadCoinDataCopyWithImpl<LoadCoinData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(List<TokenInfo> tokenInfoList) data,
    required TResult Function(String msg) error,
  }) {
    return data(tokenInfoList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<TokenInfo> tokenInfoList)? data,
    TResult Function(String msg)? error,
  }) {
    return data?.call(tokenInfoList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<TokenInfo> tokenInfoList)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(tokenInfoList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCoinInitial value) init,
    required TResult Function(LoadCoinLoading value) loading,
    required TResult Function(LoadCoinData value) data,
    required TResult Function(LoadCoinError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCoinInitial value)? init,
    TResult Function(LoadCoinLoading value)? loading,
    TResult Function(LoadCoinData value)? data,
    TResult Function(LoadCoinError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCoinInitial value)? init,
    TResult Function(LoadCoinLoading value)? loading,
    TResult Function(LoadCoinData value)? data,
    TResult Function(LoadCoinError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class LoadCoinData implements LoadCoinState {
  const factory LoadCoinData({required List<TokenInfo> tokenInfoList}) =
      _$LoadCoinData;

  List<TokenInfo> get tokenInfoList;
  @JsonKey(ignore: true)
  $LoadCoinDataCopyWith<LoadCoinData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadCoinErrorCopyWith<$Res> {
  factory $LoadCoinErrorCopyWith(
          LoadCoinError value, $Res Function(LoadCoinError) then) =
      _$LoadCoinErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class _$LoadCoinErrorCopyWithImpl<$Res>
    extends _$LoadCoinStateCopyWithImpl<$Res>
    implements $LoadCoinErrorCopyWith<$Res> {
  _$LoadCoinErrorCopyWithImpl(
      LoadCoinError _value, $Res Function(LoadCoinError) _then)
      : super(_value, (v) => _then(v as LoadCoinError));

  @override
  LoadCoinError get _value => super._value as LoadCoinError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(LoadCoinError(
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadCoinError implements LoadCoinError {
  const _$LoadCoinError({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'LoadCoinState.error(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadCoinError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  $LoadCoinErrorCopyWith<LoadCoinError> get copyWith =>
      _$LoadCoinErrorCopyWithImpl<LoadCoinError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(List<TokenInfo> tokenInfoList) data,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<TokenInfo> tokenInfoList)? data,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<TokenInfo> tokenInfoList)? data,
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
    required TResult Function(LoadCoinInitial value) init,
    required TResult Function(LoadCoinLoading value) loading,
    required TResult Function(LoadCoinData value) data,
    required TResult Function(LoadCoinError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCoinInitial value)? init,
    TResult Function(LoadCoinLoading value)? loading,
    TResult Function(LoadCoinData value)? data,
    TResult Function(LoadCoinError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCoinInitial value)? init,
    TResult Function(LoadCoinLoading value)? loading,
    TResult Function(LoadCoinData value)? data,
    TResult Function(LoadCoinError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LoadCoinError implements LoadCoinState {
  const factory LoadCoinError({required String msg}) = _$LoadCoinError;

  String get msg;
  @JsonKey(ignore: true)
  $LoadCoinErrorCopyWith<LoadCoinError> get copyWith =>
      throw _privateConstructorUsedError;
}
