// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waste_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WasteModel _$$_WasteModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_WasteModel',
      json,
      ($checkedConvert) {
        final val = _$_WasteModel(
          name: $checkedConvert('name', (v) => v as String?),
          emission: $checkedConvert('emission', (v) => (v as num?)?.toDouble()),
          desc: $checkedConvert('description', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'desc': 'description'},
    );

Map<String, dynamic> _$$_WasteModelToJson(_$_WasteModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'emission': instance.emission,
      'description': instance.desc,
    };
