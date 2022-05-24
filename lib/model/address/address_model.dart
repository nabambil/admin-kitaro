import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  // ---------------------------- CONSTRUCTORS ----------------------------
  @JsonSerializable(checked: true)
  const factory AddressModel({
    @JsonKey(name: 'address1') String? address1,
    @JsonKey(name: 'address2') String? address2,
    @JsonKey(name: 'address3') String? address3,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'state') String? state,
    @JsonKey(name: 'postcode') int? postcode,
    @JsonKey(name: 'mondayFridayHour') String? mondayFriday,
    @JsonKey(name: 'saturdayHour') String? saturday,
    @JsonKey(name: 'sundayHour') String? sunday,
    @JsonKey(name: 'publicHour') String? public,
    @JsonKey(name: 'opening') String? opening,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
