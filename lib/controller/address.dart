import 'package:admin_kitaro/database/address_dao.dart';
import 'package:admin_kitaro/model/address/address_model.dart';
import 'package:flutter/material.dart';

class AddressController {
  AddressModel _model;

  AddressController(AddressModel? model)
      : _model = model ?? const AddressModel() {
    setController(model);
    setlistener();
  }

  // OPERATION REQUIREMENT

  final Map<String, String> opening = {
    "faeeb5ca-0b13-435b-8e4f-433970a1675a": "Open To Public",
    "4551708c-cf23-4333-995a-9a279acb48c6": "Open To Staffs",
    // "4551708c-cf23-4333-995a-9a279acb48c7": "Open To Event Only",
  };

  String _keyOpenPublic = "faeeb5ca-0b13-435b-8e4f-433970a1675a";

  final TextEditingController _mondayFriday = TextEditingController();
  final TextEditingController _saturday = TextEditingController();
  final TextEditingController _sunday = TextEditingController();
  final TextEditingController _public = TextEditingController();

  TextEditingController get mondayFriday => _mondayFriday;
  TextEditingController get saturday => _saturday;
  TextEditingController get sunday => _sunday;
  TextEditingController get public => _public;
  String get keyOpenPublic => _keyOpenPublic;

  FocusNode mondayFridayNode = FocusNode();
  FocusNode saturdayNode = FocusNode();
  FocusNode sundayNode = FocusNode();
  FocusNode publicNode = FocusNode();

  // ADDRESS REQUIREMENT
  final TextEditingController _address1 = TextEditingController();
  final TextEditingController _address2 = TextEditingController();
  final TextEditingController _address3 = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _postcode = TextEditingController();
  final TextEditingController _state = TextEditingController();

  TextEditingController get address1 => _address1;
  TextEditingController get address2 => _address2;
  TextEditingController get address3 => _address3;
  TextEditingController get city => _city;
  TextEditingController get postcode => _postcode;
  TextEditingController get state => _state;

  FocusNode address1Node = FocusNode();
  FocusNode address2Node = FocusNode();
  FocusNode address3Node = FocusNode();
  FocusNode cityNode = FocusNode();
  FocusNode postcodeNode = FocusNode();
  FocusNode stateNode = FocusNode();

  void dispose() {
    _address1.dispose();
    _address2.dispose();
    _address3.dispose();
    _postcode.dispose();
    _state.dispose();
    _city.dispose();
    address1Node.dispose();
    address2Node.dispose();
    address3Node.dispose();
    cityNode.dispose();
    postcodeNode.dispose();
    stateNode.dispose();
    _mondayFriday.dispose();
    _saturday.dispose();
    _sunday.dispose();
    _public.dispose();
    mondayFridayNode.dispose();
    saturdayNode.dispose();
    sundayNode.dispose();
    publicNode.dispose();
  }

  void setlistener() {
    _address1.addListener(
      () => _model = _model.copyWith(address1: _address1.text),
    );
    _address2.addListener(
      () => _model = _model.copyWith(address2: _address2.text),
    );
    _address3.addListener(
      () => _model = _model.copyWith(address3: _address3.text),
    );
    _postcode.addListener(
      () => _model = _model.copyWith(postcode: int.parse(_postcode.text)),
    );
    _state.addListener(
      () => _model = _model.copyWith(state: _state.text),
    );
    _city.addListener(
      () => _model = _model.copyWith(city: _city.text),
    );

    _mondayFriday.addListener(
      () => _model = _model.copyWith(mondayFriday: _mondayFriday.text),
    );
    _saturday.addListener(
      () => _model = _model.copyWith(saturday: _saturday.text),
    );
    _sunday.addListener(
      () => _model = _model.copyWith(sunday: _sunday.text),
    );
    _public.addListener(
      () => _model = _model.copyWith(public: _public.text),
    );
  }

  void setController(AddressModel? model) {
    if (model != null) {
      _address1.text = model.address1 ?? "";
      _address2.text = model.address2 ?? "";
      _address3.text = model.address3 ?? "";
      _city.text = model.city ?? "";
      _postcode.text = model.postcode?.toString() ?? "";
      _state.text = model.state ?? "";
      if (model.mondayFriday == null) {
        _mondayFriday.text = "7.00AM - 7.00PM";
        _model = _model.copyWith(mondayFriday: "7.00AM - 7.00PM");
      } else {
        _mondayFriday.text = model.mondayFriday ?? "7.00AM - 7.00PM";
      }
      if (model.saturday == null) {
        _saturday.text = "8.00AM - 4.00PM";
        _model = _model.copyWith(saturday: "8.00AM - 4.00PM");
      } else {
        _saturday.text = model.saturday ?? "8.00AM - 4.00PM";
      }
      if (model.sunday == null) {
        _sunday.text = "7.00AM - 7.00PM";
        _model = _model.copyWith(sunday: "7.00AM - 7.00PM");
      } else {
        _sunday.text = model.sunday ?? "7.00AM - 7.00PM";
      }
      if (model.public == null) {
        _public.text = "8.00AM - 4.00PM";
        _model = _model.copyWith(public: "8.00AM - 4.00PM");
      } else {
        _public.text = model.public ?? "8.00AM - 4.00PM";
      }
      if (model.opening == null) {
        _model = _model.copyWith(opening: _keyOpenPublic);
      } else {
        _keyOpenPublic = model.opening ?? _keyOpenPublic;
      }
    }
  }

  void setOpening(String id) {
    _keyOpenPublic = id;

    _model = _model.copyWith(opening: _keyOpenPublic);
  }

  bool openingSelected(String id) => _keyOpenPublic == id;

  String? checkNullValidator(String? value, String title) =>
      (value?.isEmpty ?? false) ? "Please enter $title" : null;

  String? checkIntValidator(String? value, String title) =>
      (value?.isEmpty ?? false)
          ? "Please enter $title"
          : int.tryParse(value!) == null
              ? "Please enter number only"
              : null;

  // -- ACTION
  Future<String?> action(String? id) async {
    if (id == null) {
      return AddressDao().add(_model);
    }
    await AddressDao(id: id).update(_model);
    return id;
  }

  bool validateFieldChecking(List<GlobalKey<FormState>> values) {
    for (var item in values) {
      final state = item.currentState;

      if (state!.validate() == false) throw "Invalid Fields";
    }

    return true;
  }

  bool checkState(List<GlobalKey<FormState>> values) {
    for (var item in values) {
      final state = item.currentState;

      if (state == null) return false;
    }

    return true;
  }

  void delete(BuildContext context, String? id, Function refresh) {
    if (id != null) {
      AddressDao(id: id).remove();
    }
  }
}
