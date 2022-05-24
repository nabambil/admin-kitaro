// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
class _$AddressModelTearOff {
  const _$AddressModelTearOff();

  _AddressModel call(
      {@JsonKey(name: 'address1') String? address1,
      @JsonKey(name: 'address2') String? address2,
      @JsonKey(name: 'address3') String? address3,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'postcode') int? postcode,
      @JsonKey(name: 'mondayFridayHour') String? mondayFriday,
      @JsonKey(name: 'saturdayHour') String? saturday,
      @JsonKey(name: 'sundayHour') String? sunday,
      @JsonKey(name: 'publicHour') String? public,
      @JsonKey(name: 'opening') String? opening}) {
    return _AddressModel(
      address1: address1,
      address2: address2,
      address3: address3,
      city: city,
      state: state,
      postcode: postcode,
      mondayFriday: mondayFriday,
      saturday: saturday,
      sunday: sunday,
      public: public,
      opening: opening,
    );
  }

  AddressModel fromJson(Map<String, Object?> json) {
    return AddressModel.fromJson(json);
  }
}

/// @nodoc
const $AddressModel = _$AddressModelTearOff();

/// @nodoc
mixin _$AddressModel {
  @JsonKey(name: 'address1')
  String? get address1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'address2')
  String? get address2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'address3')
  String? get address3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'postcode')
  int? get postcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'mondayFridayHour')
  String? get mondayFriday => throw _privateConstructorUsedError;
  @JsonKey(name: 'saturdayHour')
  String? get saturday => throw _privateConstructorUsedError;
  @JsonKey(name: 'sundayHour')
  String? get sunday => throw _privateConstructorUsedError;
  @JsonKey(name: 'publicHour')
  String? get public => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening')
  String? get opening => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'address1') String? address1,
      @JsonKey(name: 'address2') String? address2,
      @JsonKey(name: 'address3') String? address3,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'postcode') int? postcode,
      @JsonKey(name: 'mondayFridayHour') String? mondayFriday,
      @JsonKey(name: 'saturdayHour') String? saturday,
      @JsonKey(name: 'sundayHour') String? sunday,
      @JsonKey(name: 'publicHour') String? public,
      @JsonKey(name: 'opening') String? opening});
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res> implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  final AddressModel _value;
  // ignore: unused_field
  final $Res Function(AddressModel) _then;

  @override
  $Res call({
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? address3 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postcode = freezed,
    Object? mondayFriday = freezed,
    Object? saturday = freezed,
    Object? sunday = freezed,
    Object? public = freezed,
    Object? opening = freezed,
  }) {
    return _then(_value.copyWith(
      address1: address1 == freezed
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: address2 == freezed
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      address3: address3 == freezed
          ? _value.address3
          : address3 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: postcode == freezed
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as int?,
      mondayFriday: mondayFriday == freezed
          ? _value.mondayFriday
          : mondayFriday // ignore: cast_nullable_to_non_nullable
              as String?,
      saturday: saturday == freezed
          ? _value.saturday
          : saturday // ignore: cast_nullable_to_non_nullable
              as String?,
      sunday: sunday == freezed
          ? _value.sunday
          : sunday // ignore: cast_nullable_to_non_nullable
              as String?,
      public: public == freezed
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as String?,
      opening: opening == freezed
          ? _value.opening
          : opening // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AddressModelCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$AddressModelCopyWith(
          _AddressModel value, $Res Function(_AddressModel) then) =
      __$AddressModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'address1') String? address1,
      @JsonKey(name: 'address2') String? address2,
      @JsonKey(name: 'address3') String? address3,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'postcode') int? postcode,
      @JsonKey(name: 'mondayFridayHour') String? mondayFriday,
      @JsonKey(name: 'saturdayHour') String? saturday,
      @JsonKey(name: 'sundayHour') String? sunday,
      @JsonKey(name: 'publicHour') String? public,
      @JsonKey(name: 'opening') String? opening});
}

/// @nodoc
class __$AddressModelCopyWithImpl<$Res> extends _$AddressModelCopyWithImpl<$Res>
    implements _$AddressModelCopyWith<$Res> {
  __$AddressModelCopyWithImpl(
      _AddressModel _value, $Res Function(_AddressModel) _then)
      : super(_value, (v) => _then(v as _AddressModel));

  @override
  _AddressModel get _value => super._value as _AddressModel;

  @override
  $Res call({
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? address3 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postcode = freezed,
    Object? mondayFriday = freezed,
    Object? saturday = freezed,
    Object? sunday = freezed,
    Object? public = freezed,
    Object? opening = freezed,
  }) {
    return _then(_AddressModel(
      address1: address1 == freezed
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: address2 == freezed
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      address3: address3 == freezed
          ? _value.address3
          : address3 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: postcode == freezed
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as int?,
      mondayFriday: mondayFriday == freezed
          ? _value.mondayFriday
          : mondayFriday // ignore: cast_nullable_to_non_nullable
              as String?,
      saturday: saturday == freezed
          ? _value.saturday
          : saturday // ignore: cast_nullable_to_non_nullable
              as String?,
      sunday: sunday == freezed
          ? _value.sunday
          : sunday // ignore: cast_nullable_to_non_nullable
              as String?,
      public: public == freezed
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as String?,
      opening: opening == freezed
          ? _value.opening
          : opening // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true)
class _$_AddressModel implements _AddressModel {
  const _$_AddressModel(
      {@JsonKey(name: 'address1') this.address1,
      @JsonKey(name: 'address2') this.address2,
      @JsonKey(name: 'address3') this.address3,
      @JsonKey(name: 'city') this.city,
      @JsonKey(name: 'state') this.state,
      @JsonKey(name: 'postcode') this.postcode,
      @JsonKey(name: 'mondayFridayHour') this.mondayFriday,
      @JsonKey(name: 'saturdayHour') this.saturday,
      @JsonKey(name: 'sundayHour') this.sunday,
      @JsonKey(name: 'publicHour') this.public,
      @JsonKey(name: 'opening') this.opening});

  factory _$_AddressModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddressModelFromJson(json);

  @override
  @JsonKey(name: 'address1')
  final String? address1;
  @override
  @JsonKey(name: 'address2')
  final String? address2;
  @override
  @JsonKey(name: 'address3')
  final String? address3;
  @override
  @JsonKey(name: 'city')
  final String? city;
  @override
  @JsonKey(name: 'state')
  final String? state;
  @override
  @JsonKey(name: 'postcode')
  final int? postcode;
  @override
  @JsonKey(name: 'mondayFridayHour')
  final String? mondayFriday;
  @override
  @JsonKey(name: 'saturdayHour')
  final String? saturday;
  @override
  @JsonKey(name: 'sundayHour')
  final String? sunday;
  @override
  @JsonKey(name: 'publicHour')
  final String? public;
  @override
  @JsonKey(name: 'opening')
  final String? opening;

  @override
  String toString() {
    return 'AddressModel(address1: $address1, address2: $address2, address3: $address3, city: $city, state: $state, postcode: $postcode, mondayFriday: $mondayFriday, saturday: $saturday, sunday: $sunday, public: $public, opening: $opening)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressModel &&
            const DeepCollectionEquality().equals(other.address1, address1) &&
            const DeepCollectionEquality().equals(other.address2, address2) &&
            const DeepCollectionEquality().equals(other.address3, address3) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.postcode, postcode) &&
            const DeepCollectionEquality()
                .equals(other.mondayFriday, mondayFriday) &&
            const DeepCollectionEquality().equals(other.saturday, saturday) &&
            const DeepCollectionEquality().equals(other.sunday, sunday) &&
            const DeepCollectionEquality().equals(other.public, public) &&
            const DeepCollectionEquality().equals(other.opening, opening));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(address1),
      const DeepCollectionEquality().hash(address2),
      const DeepCollectionEquality().hash(address3),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(postcode),
      const DeepCollectionEquality().hash(mondayFriday),
      const DeepCollectionEquality().hash(saturday),
      const DeepCollectionEquality().hash(sunday),
      const DeepCollectionEquality().hash(public),
      const DeepCollectionEquality().hash(opening));

  @JsonKey(ignore: true)
  @override
  _$AddressModelCopyWith<_AddressModel> get copyWith =>
      __$AddressModelCopyWithImpl<_AddressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressModelToJson(this);
  }
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel(
      {@JsonKey(name: 'address1') String? address1,
      @JsonKey(name: 'address2') String? address2,
      @JsonKey(name: 'address3') String? address3,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'postcode') int? postcode,
      @JsonKey(name: 'mondayFridayHour') String? mondayFriday,
      @JsonKey(name: 'saturdayHour') String? saturday,
      @JsonKey(name: 'sundayHour') String? sunday,
      @JsonKey(name: 'publicHour') String? public,
      @JsonKey(name: 'opening') String? opening}) = _$_AddressModel;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$_AddressModel.fromJson;

  @override
  @JsonKey(name: 'address1')
  String? get address1;
  @override
  @JsonKey(name: 'address2')
  String? get address2;
  @override
  @JsonKey(name: 'address3')
  String? get address3;
  @override
  @JsonKey(name: 'city')
  String? get city;
  @override
  @JsonKey(name: 'state')
  String? get state;
  @override
  @JsonKey(name: 'postcode')
  int? get postcode;
  @override
  @JsonKey(name: 'mondayFridayHour')
  String? get mondayFriday;
  @override
  @JsonKey(name: 'saturdayHour')
  String? get saturday;
  @override
  @JsonKey(name: 'sundayHour')
  String? get sunday;
  @override
  @JsonKey(name: 'publicHour')
  String? get public;
  @override
  @JsonKey(name: 'opening')
  String? get opening;
  @override
  @JsonKey(ignore: true)
  _$AddressModelCopyWith<_AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}
