// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recycle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecycleModel _$$_RecycleModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_RecycleModel',
      json,
      ($checkedConvert) {
        final val = _$_RecycleModel(
          datetime: $checkedConvert('datetime', (v) => v as Object),
          images: $checkedConvert('images',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          location: $checkedConvert('location', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as String?),
          username: $checkedConvert('username', (v) => v as String?),
          weight: $checkedConvert('weight', (v) => v as num?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RecycleModelToJson(_$_RecycleModel instance) =>
    <String, dynamic>{
      'datetime': instance.datetime,
      'images': instance.images,
      'location': instance.location,
      'type': instance.type,
      'username': instance.username,
      'weight': instance.weight,
    };
