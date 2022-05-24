// ignore: file_names

import 'package:admin_kitaro/controller/splash.dart';
import 'package:admin_kitaro/model/account/account_model.dart';
import 'package:admin_kitaro/state/session.dart';
import 'package:admin_kitaro/view/splash.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'dart:async';

import 'package:admin_kitaro/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

part 'stateController.freezed.dart';

@freezed
abstract class StateController with _$StateController {
  const factory StateController.noError() = _NoError;
  const factory StateController.error(String error) = _Error;
  const factory StateController.loading() = _Loading;
  const factory StateController.login(String value) = _Login;
  const factory StateController.logout() = _Logout;
  const factory StateController.obsecure(bool value) = _ObsecureValue;
}

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

  void navigate(BuildContext context, Widget page) {
    Future(
      () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
    );
  }
}

class SplashProvider {
  static Provider<SplashController> createProvider() =>
      Provider<SplashController>(create: (_) => SplashController());

  static StateNotifierProvider<SplashController, StateController> create() {
    return StateNotifierProvider<SplashController, StateController>(
      create: (_) => SplashController(),
      child: const StateView(),
    );
  }
}
