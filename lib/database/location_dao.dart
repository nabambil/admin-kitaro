import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

import '../model/location/location_model.dart';
import '../utils/api.dart';
import '../utils/constant.dart';

class LocationDao {
  final Api _api;
  final String? id;

  LocationDao({this.id})
      : _api = id == null ? Api(kLocation) : Api("$kLocation/$id");

  Future<Map<String, LocationModel>> get locations async {
    return _api.getDataCollection().then((event) {
      return _converter(_data(event));
    });
  }

  Future<LocationModel> get location async {
    return _api.getDataCollection().then((event) {
      return _converter2(_data(event));
    });
  }

  Stream<Map<String, LocationModel>> get location$ {
    return _api.streamDataCollection().transform(_handler);
  }

  StreamTransformer<DatabaseEvent, Map<String, LocationModel>> get _handler {
    return StreamTransformer.fromHandlers(handleData: (event, sink) {
      sink.add(_converter(_data(event)));
    });
  }

  Map<String, LocationModel> _converter(Map value) {
    final _map = <String, LocationModel>{};
    value.forEach((key, data) {
      _map[key] = LocationModel.fromJson(Map<String, dynamic>.from(data));
    });
    return _map;
  }

  LocationModel _converter2(Map value) {
    return LocationModel.fromJson(Map<String, dynamic>.from(value));
  }

  Map _data(DatabaseEvent event) {
    if (event.snapshot.exists) {
      return event.snapshot.value as Map;
    }

    return {};
  }

  Future<void> add(LocationModel value) => _api.addDocument(value.toJson());

  Future<void> update(LocationModel value) =>
      _api.updateDocument(value.toJson());

  Future<void> remove() => _api.removeDocument();
}
