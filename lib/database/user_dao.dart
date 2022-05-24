import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

import '../model/account/account_model.dart';
import '../utils/api.dart';
import '../utils/constant.dart';

class UserDao {
  final Api _api;

  UserDao({String? id}) : _api = id == null ? Api(kUser) : Api("$kUser/$id");

  Future<KitaroAccount> get profile async {
    return _api.getDataCollection().then((event) {
      return _converter(_data(event));
    });
  }

  Future<Map<String, KitaroAccount>> get users async {
    return _api.getDataCollection().then((event) {
      return _converterList(_data(event));
    });
  }

  Stream<KitaroAccount> get profile$ {
    return _api.streamDataCollection().transform(_handler);
  }

  StreamTransformer<DatabaseEvent, KitaroAccount> get _handler {
    return StreamTransformer.fromHandlers(handleData: (event, sink) {
      sink.add(_converter(_data(event)));
    });
  }

  Map<String, KitaroAccount> _converterList(Map value) {
    final _map = <String, KitaroAccount>{};
    value.forEach((key, data) {
      _map[key] = _converter(data);
    });
    return _map;
  }

  KitaroAccount _converter(Map value) {
    final result = Map<String, dynamic>.from(value);

    KitaroAccount acc = KitaroAccount.fromJson(result);

    if (result.containsKey("managers")) {
      final List list = result["managers"];
      final List<String> managers = list.map((e) => e.toString()).toList();
      acc = acc.copyWith(managers: managers);
    }

    return acc;
  }

  Map _data(DatabaseEvent event) {
    if (event.snapshot.exists) {
      return event.snapshot.value as Map;
    }

    return {};
  }

  Future<void> add({required KitaroAccount value, required String id}) =>
      _api.add(id, value.toJson());

  Future<void> update(KitaroAccount value) {
    final json = value.toJson();
    final managers = value.managers;
    if (managers != null) {
      if (managers.isNotEmpty) {
        json["managers"] = managers;
      }
    }
    return _api.updateDocument(json);
  }

  Future<void> remove() => _api.removeDocument();
}
