import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

import '../model/recycle/recycle_model.dart';
import '../utils/api.dart';
import '../utils/constant.dart';

class RecycleDao {
  final Api _api;

  RecycleDao({String? id})
      : _api = id == null ? Api(kRecycle) : Api("$kRecycle/$id");

  Future<Map<String, RecycleModel>> get recycle async {
    return _api.getDataCollection().then((event) => _converter(_data(event)));
  }

  Stream<Map<String, RecycleModel>> get recycle$ {
    return _api.streamDataCollection().transform(_handler);
  }

  StreamTransformer<DatabaseEvent, Map<String, RecycleModel>> get _handler {
    return StreamTransformer.fromHandlers(handleData: (event, sink) {
      sink.add(_converter(_data(event)));
    });
  }

  Map<String, RecycleModel> _converter(Map value) {
    final _map = <String, RecycleModel>{};
    value.forEach((key, value) {
      _map[key] = RecycleModel.fromJson(Map<String, dynamic>.from(value));
    });
    return _map;
  }

  Map _data(DatabaseEvent event) {
    if (event.snapshot.exists) {
      return event.snapshot.value as Map;
    }

    return {};
  }

  Future<String?> add(RecycleModel value) => _api.addDocument(value.toJson());

  Future<Map<String, RecycleModel>> getRecycles(
      {required String key, required String value}) async {
    var _recycles = await _api
        .getDataCollectionBy(key, value)
        .then((event) => _converter(_data(event)));
    return _recycles;
  }

  Future<void> update(RecycleModel value) =>
      _api.updateDocument(value.toJson());
}
