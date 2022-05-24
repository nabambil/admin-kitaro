import 'package:freezed_annotation/freezed_annotation.dart';

part 'waste_model.freezed.dart';
part 'waste_model.g.dart';

@freezed
class WasteModel with _$WasteModel {
  // ---------------------------- CONSTRUCTORS ----------------------------
  @JsonSerializable(checked: true)
  const factory WasteModel({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'emission') double? emission,
    @JsonKey(name: 'description') String? desc,
  }) = _WasteModel;

  factory WasteModel.fromJson(Map<String, dynamic> json) =>
      _$WasteModelFromJson(json);
}
