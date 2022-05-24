import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel {
  // ---------------------------- CONSTRUCTORS ----------------------------
  @JsonSerializable(checked: true)
  const factory LocationModel({
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'direction') String? direction,
    @JsonKey(name: 'isWeight') int? isWeight,
    @JsonKey(name: 'lat') double? lat,
    @JsonKey(name: 'long') double? long,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'wastes') List<String>? wastes,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}
