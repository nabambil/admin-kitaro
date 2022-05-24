// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KitaroAccount _$KitaroAccountFromJson(Map<String, dynamic> json) {
  return _KitaroAccount.fromJson(json);
}

/// @nodoc
class _$KitaroAccountTearOff {
  const _$KitaroAccountTearOff();

  _KitaroAccount call(
      {@JsonKey(name: "username") String? username,
      @JsonKey(name: "token") String? token,
      @JsonKey(name: "role") String? role,
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "lastName") String? lastName,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "idNo") String? idNo,
      @JsonKey(name: 'managers') List<String>? managers}) {
    return _KitaroAccount(
      username: username,
      token: token,
      role: role,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      address: address,
      idNo: idNo,
      managers: managers,
    );
  }

  KitaroAccount fromJson(Map<String, Object?> json) {
    return KitaroAccount.fromJson(json);
  }
}

/// @nodoc
const $KitaroAccount = _$KitaroAccountTearOff();

/// @nodoc
mixin _$KitaroAccount {
  @JsonKey(name: "username")
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: "token")
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: "firstName")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "lastName")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "idNo")
  String? get idNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'managers')
  List<String>? get managers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitaroAccountCopyWith<KitaroAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitaroAccountCopyWith<$Res> {
  factory $KitaroAccountCopyWith(
          KitaroAccount value, $Res Function(KitaroAccount) then) =
      _$KitaroAccountCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "username") String? username,
      @JsonKey(name: "token") String? token,
      @JsonKey(name: "role") String? role,
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "lastName") String? lastName,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "idNo") String? idNo,
      @JsonKey(name: 'managers') List<String>? managers});
}

/// @nodoc
class _$KitaroAccountCopyWithImpl<$Res>
    implements $KitaroAccountCopyWith<$Res> {
  _$KitaroAccountCopyWithImpl(this._value, this._then);

  final KitaroAccount _value;
  // ignore: unused_field
  final $Res Function(KitaroAccount) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? token = freezed,
    Object? role = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? idNo = freezed,
    Object? managers = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      idNo: idNo == freezed
          ? _value.idNo
          : idNo // ignore: cast_nullable_to_non_nullable
              as String?,
      managers: managers == freezed
          ? _value.managers
          : managers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$KitaroAccountCopyWith<$Res>
    implements $KitaroAccountCopyWith<$Res> {
  factory _$KitaroAccountCopyWith(
          _KitaroAccount value, $Res Function(_KitaroAccount) then) =
      __$KitaroAccountCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "username") String? username,
      @JsonKey(name: "token") String? token,
      @JsonKey(name: "role") String? role,
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "lastName") String? lastName,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "idNo") String? idNo,
      @JsonKey(name: 'managers') List<String>? managers});
}

/// @nodoc
class __$KitaroAccountCopyWithImpl<$Res>
    extends _$KitaroAccountCopyWithImpl<$Res>
    implements _$KitaroAccountCopyWith<$Res> {
  __$KitaroAccountCopyWithImpl(
      _KitaroAccount _value, $Res Function(_KitaroAccount) _then)
      : super(_value, (v) => _then(v as _KitaroAccount));

  @override
  _KitaroAccount get _value => super._value as _KitaroAccount;

  @override
  $Res call({
    Object? username = freezed,
    Object? token = freezed,
    Object? role = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? idNo = freezed,
    Object? managers = freezed,
  }) {
    return _then(_KitaroAccount(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      idNo: idNo == freezed
          ? _value.idNo
          : idNo // ignore: cast_nullable_to_non_nullable
              as String?,
      managers: managers == freezed
          ? _value.managers
          : managers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true)
class _$_KitaroAccount implements _KitaroAccount {
  const _$_KitaroAccount(
      {@JsonKey(name: "username") this.username,
      @JsonKey(name: "token") this.token,
      @JsonKey(name: "role") this.role,
      @JsonKey(name: "firstName") this.firstName,
      @JsonKey(name: "lastName") this.lastName,
      @JsonKey(name: "phone") this.phone,
      @JsonKey(name: "address") this.address,
      @JsonKey(name: "idNo") this.idNo,
      @JsonKey(name: 'managers') this.managers});

  factory _$_KitaroAccount.fromJson(Map<String, dynamic> json) =>
      _$$_KitaroAccountFromJson(json);

  @override
  @JsonKey(name: "username")
  final String? username;
  @override
  @JsonKey(name: "token")
  final String? token;
  @override
  @JsonKey(name: "role")
  final String? role;
  @override
  @JsonKey(name: "firstName")
  final String? firstName;
  @override
  @JsonKey(name: "lastName")
  final String? lastName;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "address")
  final String? address;
  @override
  @JsonKey(name: "idNo")
  final String? idNo;
  @override
  @JsonKey(name: 'managers')
  final List<String>? managers;

  @override
  String toString() {
    return 'KitaroAccount(username: $username, token: $token, role: $role, firstName: $firstName, lastName: $lastName, phone: $phone, address: $address, idNo: $idNo, managers: $managers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KitaroAccount &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.idNo, idNo) &&
            const DeepCollectionEquality().equals(other.managers, managers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(idNo),
      const DeepCollectionEquality().hash(managers));

  @JsonKey(ignore: true)
  @override
  _$KitaroAccountCopyWith<_KitaroAccount> get copyWith =>
      __$KitaroAccountCopyWithImpl<_KitaroAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KitaroAccountToJson(this);
  }
}

abstract class _KitaroAccount implements KitaroAccount {
  const factory _KitaroAccount(
      {@JsonKey(name: "username") String? username,
      @JsonKey(name: "token") String? token,
      @JsonKey(name: "role") String? role,
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "lastName") String? lastName,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "idNo") String? idNo,
      @JsonKey(name: 'managers') List<String>? managers}) = _$_KitaroAccount;

  factory _KitaroAccount.fromJson(Map<String, dynamic> json) =
      _$_KitaroAccount.fromJson;

  @override
  @JsonKey(name: "username")
  String? get username;
  @override
  @JsonKey(name: "token")
  String? get token;
  @override
  @JsonKey(name: "role")
  String? get role;
  @override
  @JsonKey(name: "firstName")
  String? get firstName;
  @override
  @JsonKey(name: "lastName")
  String? get lastName;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "address")
  String? get address;
  @override
  @JsonKey(name: "idNo")
  String? get idNo;
  @override
  @JsonKey(name: 'managers')
  List<String>? get managers;
  @override
  @JsonKey(ignore: true)
  _$KitaroAccountCopyWith<_KitaroAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
