import 'package:admin_kitaro/state/stateController.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Handler {
  static toastHandler(StateController state, BuildContext context) {
    state.when(
      noError: () {
        // Fluttertoast.cancel();
      },
      error: (err) {
        Fluttertoast.cancel();
        Fluttertoast.showToast(msg: err);
      },
      loading: () {
        Fluttertoast.cancel();
        Fluttertoast.showToast(msg: "Loading");
      },
      login: (String firstName) {
        Fluttertoast.cancel();
        Fluttertoast.showToast(msg: "Welcome $firstName");
      },
      logout: () {
        Fluttertoast.cancel();
        Fluttertoast.showToast(msg: "You're Logout");
      },
      obsecure: (bool value) {},
    );
  }
}
