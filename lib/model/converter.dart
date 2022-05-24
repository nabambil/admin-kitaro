import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class NullableDateTimeJsonConverter
    implements JsonConverter<DateTime?, dynamic> {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const NullableDateTimeJsonConverter();

  // ------------------------------- METHODS ------------------------------
  @override
  DateTime? fromJson(dynamic json) {
    if (json is Timestamp) {
      return json.toDate();
    }

    return null;
  }

  @override
  Object? toJson(Object? fieldValue) {
    print('toJson is FieldValue fireStore object $fieldValue');
    return fieldValue as Map<String,String>;
  }
}
