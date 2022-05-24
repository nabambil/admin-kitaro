// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KitaroAccount _$$_KitaroAccountFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_KitaroAccount',
      json,
      ($checkedConvert) {
        final val = _$_KitaroAccount(
          username: $checkedConvert('username', (v) => v as String?),
          token: $checkedConvert('token', (v) => v as String?),
          role: $checkedConvert('role', (v) => v as String?),
          firstName: $checkedConvert('firstName', (v) => v as String?),
          lastName: $checkedConvert('lastName', (v) => v as String?),
          phone: $checkedConvert('phone', (v) => v as String?),
          address: $checkedConvert('address', (v) => v as String?),
          idNo: $checkedConvert('idNo', (v) => v as String?),
          managers: $checkedConvert('managers',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_KitaroAccountToJson(_$_KitaroAccount instance) =>
    <String, dynamic>{
      'username': instance.username,
      'token': instance.token,
      'role': instance.role,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'address': instance.address,
      'idNo': instance.idNo,
      'managers': instance.managers,
    };
