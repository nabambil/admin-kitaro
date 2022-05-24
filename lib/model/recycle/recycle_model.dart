import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../converter.dart';

part 'recycle_model.freezed.dart';
part 'recycle_model.g.dart';

FieldValue? _sendAtFromJson(FieldValue? fieldValue) => fieldValue;

@freezed
class RecycleModel with _$RecycleModel {
  // ---------------------------- CONSTRUCTORS ----------------------------
  @JsonSerializable(checked: true)
  const factory RecycleModel({
    @NullableDateTimeJsonConverter() @JsonKey(name: 'datetime') required Object datetime,
    @JsonKey(name: 'images') List<String>? images,
    @JsonKey(name: 'location') String? location,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'weight') num? weight,
  }) = _RecycleModel;

  factory RecycleModel.fromJson(Map<String, dynamic> json) =>
      _$RecycleModelFromJson(json);
}
