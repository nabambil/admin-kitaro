import 'package:admin_kitaro/database/user_dao.dart';
import 'package:admin_kitaro/model/account/account_model.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class UserController {
  KitaroAccount? model;

  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmation = TextEditingController();

  final FocusNode nodeName = FocusNode();
  final FocusNode nodeEmail = FocusNode();
  final FocusNode nodePassword = FocusNode();
  final FocusNode nodeConfirmation = FocusNode();

  get key => _formKey;
  get name => _name;
  get email => _email;
  get password => _password;
  get confirmation => _confirmation;

  UserController({required this.model}) {
    model ??= const KitaroAccount(role: "admin");

    if (model != null) {
      final String? email = model!.username;
      final String? name = model!.firstName;

      _email.text = email ?? "";
      _name.text = name ?? "";
    }

    _name.addListener(() => model = model?.copyWith(firstName: _name.text));
    _email.addListener(() => model = model?.copyWith(username: _email.text));
  }

  String title(String? value) {
    if (value == null) {
      return "Add New User";
    }

    return "Update User";
  }

  String actionTitle(String? value) {
    if (value == null) {
      return "ADD";
    }

    return "UPDATE";
  }

  // -- VALIDATION
  String? emailValidator(String? value) {
    if ((value ?? "").isEmpty) {
      nodeEmail.requestFocus();
      return "Please enter email";
    } else if (EmailValidator.validate(value!) == false) {
      return "Please enter correct email format";
    }

    return null;
  }

  String? nameValidator(String? value) {
    if ((value ?? "").isEmpty) {
      nodeName.requestFocus();
      return "Please enter type name";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if ((value ?? "").isEmpty) {
      nodePassword.requestFocus();
      return "Please enter password";
    }

    return null;
  }

  String? confirmationValidator(String? value) {
    final password = _password.text;

    if (value != password) {
      nodeConfirmation.requestFocus();
      return "password not match";
    }
    return null;
  }

  void setLocation(String? id) {
    if (model != null && id != null) {
      final list = model!.managers ?? [];
      if (list.contains(id) == false) {
        list.add(id);
      } else {
        list.removeWhere((element) => element == id);
      }
      model = model!.copyWith(managers: list);
    }
  }

  bool checkManagingLocation(String id) {
    if (model != null) {
      final list = model!.managers ?? [];
      return list.contains(id);
    }
    return false;
  }

  Future<String?> createAcc() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      final user = userCredential.user;
      if (user == null) {
        throw "no user created";
      }
      return user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        throw "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        throw "The account already exists for that email.";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return null;
  }

  // -- ACTION
  void action(String? id, BuildContext context, Function refresh) {
    if (_formKey.currentState!.validate()) {
      if (id == null) {
        _showDialog(context, "Do you confirm want to ADD?", () async {
          final uid = await createAcc();
          if (uid != null && model != null) {
            dismiss(context, null)
                .then((value) => dismiss(context, null))
                .whenComplete(() => UserDao().add(id: uid, value: model!))
                .then((value) => refresh());
          }
        });
      } else {
        _showDialog(context, "Do you confirm want to UPDATE?", () {
          UserDao(id: id)
              .update(model!)
              .then((_) => dismiss(context, null))
              .catchError((err) => dismiss(context, refresh))
              .whenComplete(() => dismiss(context, null));
        });
      }
    }
  }

  void delete(BuildContext context, String? id, Function refresh) {
    if (id != null) {
      _showDialog(context, "Do you confirm want to DELETE?", () {
        return UserDao(id: id)
            .remove()
            .then((value) => dismiss(context, refresh))
            .catchError((err) => dismiss(context, refresh));
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
            onPressed: () {
              dismiss(context, null).then((value) => dismiss(context, null));
            },
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

  Future<void> dismiss(BuildContext context, Function? refresh) async {
    if (refresh != null) {
      refresh();
    }

    Navigator.pop(context);

    return;
  }
}
