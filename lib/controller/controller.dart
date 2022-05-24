import 'dart:async';

import 'package:admin_kitaro/model/account/account_model.dart';
import 'package:admin_kitaro/model/location/location_model.dart';
import 'package:admin_kitaro/state/detail.dart';
import 'package:admin_kitaro/state/session.dart';
import 'package:admin_kitaro/state/stateController.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

abstract class MainController extends StateNotifier<StateController>
    with LocatorMixin {
  MainController() : super(const StateController.loading());

  void error(String? text) {
    final String err = text ?? "Please contact admin";
    state = StateController.error(err);
  }

  void loading() {
    state = const StateController.loading();
  }

  void done() {
    Timer(
      const Duration(seconds: 1),
      () => state = const StateController.noError(),
    );
  }

  void login(KitaroAccount acc) {
    read<SessionNotifier>().setSession(acc);
    state = StateController.login(acc.firstName ?? "");
  }

  void logout(BuildContext context) async {
    state = const StateController.loading();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(kCache);
    prefs.remove(kRole);
    Future(() => Navigator.of(context).popUntil((route) => route.isFirst));

    state = const StateController.logout();
  }

  void visible(bool value) {
    state = StateController.obsecure(value);
  }

  Future<void> navigate(BuildContext context, Widget page) {
    return Future(
      () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
    );
  }

  void navigateDetail(BuildContext context, LocationModel model, String id) {
    Future(
      () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => DetailProvider.create(model, id))),
    );
  }
}
