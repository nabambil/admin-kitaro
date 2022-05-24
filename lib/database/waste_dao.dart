import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

import '../model/waste/waste_model.dart';
import '../utils/api.dart';
import '../utils/constant.dart';

class WasteDao {
  final Api _api;
  final String? id;

  WasteDao({this.id}) : _api = id == null ? Api(kWaste) : Api("$kWaste/$id");

  Future<WasteModel> get waste async {
    return _api.getDataCollection().then((event) => _converter(_data(event)));
  }

  Future<Map<String, WasteModel>> get wastes async {
    return _api.getDataCollection().then((event) {
      final _res = _converterList(_data(event));

      return _res;
    });
  }

  Stream<WasteModel> get waste$ {
    return _api.streamDataCollection().transform(_handler);
  }

  Stream<Map<String, WasteModel>> get wastes$ {
    return _api.streamDataCollection().transform(_handlerList);
  }

  StreamTransformer<DatabaseEvent, WasteModel> get _handler {
    return StreamTransformer.fromHandlers(handleData: (event, sink) {
      sink.add(_converter(_data(event)));
    });
  }

  StreamTransformer<DatabaseEvent, Map<String, WasteModel>> get _handlerList {
    return StreamTransformer.fromHandlers(handleData: (event, sink) {
      sink.add(_converterList(_data(event)));
    });
  }

  WasteModel _converter(Map value) {
    return WasteModel.fromJson(Map<String, dynamic>.from(value));
  }

  Map<String, WasteModel> _converterList(Map value) {
    final _map = <String, WasteModel>{};

    value.forEach((key, data) {
      _map[key] = WasteModel.fromJson(Map<String, dynamic>.from(data));
    });

    return _map;
  }

  Map _data(DatabaseEvent event) {
    if (event.snapshot.exists) {
      return event.snapshot.value as Map;
    }

    return {};
  }

  Future<void> add(WasteModel value) => _api.addDocument(value.toJson());

  Future<void> update(WasteModel value) => _api.updateDocument(value.toJson());

  Future<void> remove() {
    if (id != null) {
      return _api.removeDocument();
    }
    throw "Item not selected";
  }
}
