// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'waste_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WasteModel _$WasteModelFromJson(Map<String, dynamic> json) {
  return _WasteModel.fromJson(json);
}

/// @nodoc
class _$WasteModelTearOff {
  const _$WasteModelTearOff();

  _WasteModel call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'emission') double? emission,
      @JsonKey(name: 'description') String? desc}) {
    return _WasteModel(
      name: name,
      emission: emission,
      desc: desc,
    );
  }

  WasteModel fromJson(Map<String, Object?> json) {
    return WasteModel.fromJson(json);
  }
}

/// @nodoc
const $WasteModel = _$WasteModelTearOff();

/// @nodoc
mixin _$WasteModel {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'emission')
  double? get emission => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WasteModelCopyWith<WasteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WasteModelCopyWith<$Res> {
  factory $WasteModelCopyWith(
          WasteModel value, $Res Function(WasteModel) then) =
      _$WasteModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'emission') double? emission,
      @JsonKey(name: 'description') String? desc});
}

/// @nodoc
class _$WasteModelCopyWithImpl<$Res> implements $WasteModelCopyWith<$Res> {
  _$WasteModelCopyWithImpl(this._value, this._then);

  final WasteModel _value;
  // ignore: unused_field
  final $Res Function(WasteModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? emission = freezed,
    Object? desc = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      emission: emission == freezed
          ? _value.emission
          : emission // ignore: cast_nullable_to_non_nullable
              as double?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$WasteModelCopyWith<$Res> implements $WasteModelCopyWith<$Res> {
  factory _$WasteModelCopyWith(
          _WasteModel value, $Res Function(_WasteModel) then) =
      __$WasteModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'emission') double? emission,
      @JsonKey(name: 'description') String? desc});
}

/// @nodoc
class __$WasteModelCopyWithImpl<$Res> extends _$WasteModelCopyWithImpl<$Res>
    implements _$WasteModelCopyWith<$Res> {
  __$WasteModelCopyWithImpl(
      _WasteModel _value, $Res Function(_WasteModel) _then)
      : super(_value, (v) => _then(v as _WasteModel));

  @override
  _WasteModel get _value => super._value as _WasteModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? emission = freezed,
    Object? desc = freezed,
  }) {
    return _then(_WasteModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      emission: emission == freezed
          ? _value.emission
          : emission // ignore: cast_nullable_to_non_nullable
              as double?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true)
class _$_WasteModel implements _WasteModel {
  const _$_WasteModel(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'emission') this.emission,
      @JsonKey(name: 'description') this.desc});

  factory _$_WasteModel.fromJson(Map<String, dynamic> json) =>
      _$$_WasteModelFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'emission')
  final double? emission;
  @override
  @JsonKey(name: 'description')
  final String? desc;

  @override
  String toString() {
    return 'WasteModel(name: $name, emission: $emission, desc: $desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WasteModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.emission, emission) &&
            const DeepCollectionEquality().equals(other.desc, desc));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(emission),
      const DeepCollectionEquality().hash(desc));

  @JsonKey(ignore: true)
  @override
  _$WasteModelCopyWith<_WasteModel> get copyWith =>
      __$WasteModelCopyWithImpl<_WasteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WasteModelToJson(this);
  }
}

abstract class _WasteModel implements WasteModel {
  const factory _WasteModel(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'emission') double? emission,
      @JsonKey(name: 'description') String? desc}) = _$_WasteModel;

  factory _WasteModel.fromJson(Map<String, dynamic> json) =
      _$_WasteModel.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'emission')
  double? get emission;
  @override
  @JsonKey(name: 'description')
  String? get desc;
  @override
  @JsonKey(ignore: true)
  _$WasteModelCopyWith<_WasteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
