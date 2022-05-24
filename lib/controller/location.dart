import 'package:admin_kitaro/database/address_dao.dart';
import 'package:admin_kitaro/database/location_dao.dart';
import 'package:admin_kitaro/model/address/address_model.dart';
import 'package:admin_kitaro/model/location/location_model.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationController {
  LocationModel _model;

  final Map<String, String> facilities = {
    "5b48ec8b-0b8b-4d18-967e-19bd22e3fd57": "Kiosk",
    "ed6f506a-91ad-4c16-a87c-36ab5cf885b1": "Recycling Centre",
  };

  bool _isWeight = false;
  String _keyFacilities = "ed6f506a-91ad-4c16-a87c-36ab5cf885b1";

  final TextEditingController _direction = TextEditingController();
  final TextEditingController _name = TextEditingController();

  final FocusNode directionNode = FocusNode();
  final FocusNode nameNode = FocusNode();

  TextEditingController get direction => _direction;
  TextEditingController get name => _name;
  bool get isWeight => _isWeight;
  String get keyFacilities => _keyFacilities;

  LocationController(LocationModel? model)
      : _model = model ?? const LocationModel() {
    if (_model.type == null) {
      _model = _model.copyWith(
        type: _keyFacilities,
      );
    } else {
      _keyFacilities = _model.type!;
    }
    if (_model.isWeight == null) {
      _model = _model.copyWith(
        isWeight: _isWeight ? 1 : 0,
      );
    } else {
      _isWeight = _model.isWeight! == 1 ? true : false;
    }

    listener();
    setListenerController(_model);

    if (model?.lat == null && model?.long == null) {
      Location location = Location();
      location
          .serviceEnabled()
          .then((value) => value
              ? location.requestService()
              : throw "Permission Not Allowed")
          .then((value) => location.hasPermission())
          .then((value) => value == PermissionStatus.denied
              ? location.requestPermission()
              : location.getLocation())
          .then((value) => value is PermissionStatus
              ? location.getLocation()
              : value is LocationData
                  ? value
                  : throw "Permission Not Allowed")
          .then((value) => value is LocationData
              ? _model = _model.copyWith(
                  lat: value.latitude,
                  long: value.longitude,
                )
              : throw "unable to retrieve location");
    }
  }

  void dispose() {
    _direction.dispose();
    _name.dispose();
    directionNode.dispose();
    nameNode.dispose();
  }

  Future<AddressModel> get address {
    final _value = _model.address;
    if (_value != null) {
      return AddressDao(id: _value).address;
    }
    return Future.error("No Address");
  }

  void listener() {
    _direction.addListener(
      () => _model = _model.copyWith(direction: _direction.text),
    );
    _name.addListener(
      () => _model = _model.copyWith(name: _name.text),
    );
  }

  void setListenerController(LocationModel? model) {
    if (model != null) {
      _direction.text = model.direction ?? "";
      _name.text = model.name ?? "";
    }
  }

  String title(String? value) {
    if (value == null) {
      return "Add New Location";
    }

    return "Update Location";
  }

  String actionTitle(String? value) {
    if (value == null) {
      return "ADD";
    }

    return "UPDATE";
  }

  void setIsWeight() {
    _isWeight = !_isWeight;

    _model = _model.copyWith(isWeight: _isWeight ? 1 : 0);
  }

  bool isWeightSelected(String value) {
    if (isWeight) {
      return value == "Yes";
    } else {
      return value == "No";
    }
  }

  void setFacilities(String id) {
    _keyFacilities = id;

    _model = _model.copyWith(type: _keyFacilities);
  }

  bool facilitiesSelected(String id) => _keyFacilities == id;

  void setAddress(String id) {
    _model = _model.copyWith(address: id);
  }

  void setWaste(String? id) {
    if (id != null) {
      final list = _model.wastes ?? [];
      if (list.contains(id) == false) {
        list.add(id);
      } else {
        list.removeWhere((element) => element == id);
      }
      _model = _model.copyWith(wastes: list);
    }
  }

  bool checkManagingWaste(String id) {
    final list = _model.wastes ?? [];
    return list.contains(id);
  }

  String? checkNullValidator(String? value, String title) =>
      (value?.isEmpty ?? false) ? "Please enter $title" : null;

  // -- ACTION
  Future<dynamic> action(String? id, BuildContext context) {
    if (id == null) {
      _showDialog(context, "Do you confirm want to ADD?", () async {
        return LocationDao()
            .add(_model)
            .then((value) => dismiss(context))
            .catchError((err) => dismiss(context))
            .whenComplete(() => dismiss(context));
      });
    }
    return LocationDao(id: id)
        .update(_model)
        .then((value) => dismiss(context))
        .catchError((err) => dismiss(context))
        .whenComplete(() => dismiss(context));
  }

  void delete(BuildContext context, String? id) {
    if (id != null) {
      _showDialog(context, "Do you confirm want to DELETE?", () {
        return LocationDao(id: id)
            .remove()
            .then((value) => dismiss(context))
            .catchError((err) => dismiss(context));
      });
    }
  }

  // -- DIALOG

  void _showDialog(BuildContext context, String content, Function action) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          "Alert",
          style: kRedStyleBold,
        ),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => dismiss(context),
            child: const Text("Cancel", style: kGreyStyle),
          ),
          TextButton(
            onPressed: () => action(),
            child: const Text("Confirm", style: kThemeStyle),
          )
        ],
      ),
    );
  }

  void updateDialog(BuildContext context, Function action) {
    return _showDialog(context, "Do you confirm want to UPDATE?", action);
  }

  Future<void> dismiss(BuildContext context) async {
    Navigator.pop(context);

    return;
  }
}
