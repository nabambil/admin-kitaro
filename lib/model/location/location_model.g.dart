// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationModel _$$_LocationModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_LocationModel',
      json,
      ($checkedConvert) {
        final val = _$_LocationModel(
          address: $checkedConvert('address', (v) => v as String?),
          direction: $checkedConvert('direction', (v) => v as String?),
          isWeight: $checkedConvert('isWeight', (v) => v as int?),
          lat: $checkedConvert('lat', (v) => (v as num?)?.toDouble()),
          long: $checkedConvert('long', (v) => (v as num?)?.toDouble()),
          name: $checkedConvert('name', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as String?),
          wastes: $checkedConvert('wastes',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_LocationModelToJson(_$_LocationModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'direction': instance.direction,
      'isWeight': instance.isWeight,
      'lat': instance.lat,
      'long': instance.long,
      'name': instance.name,
      'type': instance.type,
      'wastes': instance.wastes,
    };
