import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class KitaroAccount with _$KitaroAccount {
  // ---------------------------- CONSTRUCTORS ----------------------------
  @JsonSerializable(checked: true)
  const factory KitaroAccount({
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "firstName") String? firstName,
    @JsonKey(name: "lastName") String? lastName,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "idNo") String? idNo,
    @JsonKey(name: 'managers') List<String>? managers,
  }) = _KitaroAccount;

  factory KitaroAccount.fromJson(Map<String, dynamic> json) =>
      _$KitaroAccountFromJson(json);
}
