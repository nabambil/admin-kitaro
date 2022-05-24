// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SessionStateTearOff {
  const _$SessionStateTearOff();

  _Initial initial(KitaroAccount acc) {
    return _Initial(
      acc,
    );
  }

  _Dismiss dismiss() {
    return const _Dismiss();
  }
}

/// @nodoc
const $SessionState = _$SessionStateTearOff();

/// @nodoc
mixin _$SessionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KitaroAccount acc) initial,
    required TResult Function() dismiss,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KitaroAccount acc)? initial,
    TResult Function()? dismiss,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KitaroAccount acc)? initial,
    TResult Function()? dismiss,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Dismiss value) dismiss,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Dismiss value)? dismiss,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Dismiss value)? dismiss,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStateCopyWith<$Res> {
  factory $SessionStateCopyWith(
          SessionState value, $Res Function(SessionState) then) =
      _$SessionStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SessionStateCopyWithImpl<$Res> implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._value, this._then);

  final SessionState _value;
  // ignore: unused_field
  final $Res Function(SessionState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  $Res call({KitaroAccount acc});

  $KitaroAccountCopyWith<$Res> get acc;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$SessionStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? acc = freezed,
  }) {
    return _then(_Initial(
      acc == freezed
          ? _value.acc
          : acc // ignore: cast_nullable_to_non_nullable
              as KitaroAccount,
    ));
  }

  @override
  $KitaroAccountCopyWith<$Res> get acc {
    return $KitaroAccountCopyWith<$Res>(_value.acc, (value) {
      return _then(_value.copyWith(acc: value));
    });
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(this.acc);

  @override
  final KitaroAccount acc;

  @override
  String toString() {
    return 'SessionState.initial(acc: $acc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality().equals(other.acc, acc));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(acc));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KitaroAccount acc) initial,
    required TResult Function() dismiss,
  }) {
    return initial(acc);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KitaroAccount acc)? initial,
    TResult Function()? dismiss,
  }) {
    return initial?.call(acc);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KitaroAccount acc)? initial,
    TResult Function()? dismiss,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(acc);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Dismiss value) dismiss,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Dismiss value)? dismiss,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Dismiss value)? dismiss,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SessionState {
  const factory _Initial(KitaroAccount acc) = _$_Initial;

  KitaroAccount get acc;
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DismissCopyWith<$Res> {
  factory _$DismissCopyWith(_Dismiss value, $Res Function(_Dismiss) then) =
      __$DismissCopyWithImpl<$Res>;
}

/// @nodoc
class __$DismissCopyWithImpl<$Res> extends _$SessionStateCopyWithImpl<$Res>
    implements _$DismissCopyWith<$Res> {
  __$DismissCopyWithImpl(_Dismiss _value, $Res Function(_Dismiss) _then)
      : super(_value, (v) => _then(v as _Dismiss));

  @override
  _Dismiss get _value => super._value as _Dismiss;
}

/// @nodoc

class _$_Dismiss implements _Dismiss {
  const _$_Dismiss();

  @override
  String toString() {
    return 'SessionState.dismiss()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Dismiss);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KitaroAccount acc) initial,
    required TResult Function() dismiss,
  }) {
    return dismiss();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KitaroAccount acc)? initial,
    TResult Function()? dismiss,
  }) {
    return dismiss?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KitaroAccount acc)? initial,
    TResult Function()? dismiss,
    required TResult orElse(),
  }) {
    if (dismiss != null) {
      return dismiss();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Dismiss value) dismiss,
  }) {
    return dismiss(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Dismiss value)? dismiss,
  }) {
    return dismiss?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Dismiss value)? dismiss,
    required TResult orElse(),
  }) {
    if (dismiss != null) {
      return dismiss(this);
    }
    return orElse();
  }
}

abstract class _Dismiss implements SessionState {
  const factory _Dismiss() = _$_Dismiss;
}
