import 'package:admin_kitaro/controller/controller.dart';
import 'package:admin_kitaro/database/user_dao.dart';
import 'package:email_validator/email_validator.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends MainController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyForgot = GlobalKey<FormState>();
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? forgotMailController;
  FocusNode? _usernameNode;
  FocusNode? _passwordNode;

  FocusNode? get node1 => _usernameNode;
  FocusNode? get node2 => _passwordNode;

  bool _visible = true;

  void viewPassword() {
    _visible = !_visible;

    super.visible(_visible);
  }

  get obsecureVisible => _visible;

  void dispose() {
    _usernameNode?.dispose();
    _passwordNode?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    forgotMailController?.dispose();
  }

  void clear() {
    emailController?.clear();
    passwordController?.clear();
    forgotMailController?.clear();
  }

  void initiateField() {
    emailController ??= TextEditingController();
    passwordController ??= TextEditingController();
    forgotMailController ??= TextEditingController();
    _usernameNode ??= FocusNode();
    _passwordNode ??= FocusNode();
  }

  String? mailValidator(String? value) {
    if ((value ?? "").isEmpty) {
      return "Please Enter your Email";
    }

    final valid = EmailValidator.validate(value!);
    if (valid == false) {
      return "Please enter correct email format";
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if ((value ?? "").isEmpty) {
      return "Please Enter your Password";
    }
    return null;
  }

  void tryLogin() {
    if (formKey.currentState!.validate()) {
      loading();
      signIn();
    }
  }

  Future<void> reset() async {
    loading();
    try {
      if (forgotMailController != null) {
        final text = forgotMailController!.text;
        await FirebaseAuth.instance.sendPasswordResetEmail(email: text);
      } else {
        throw "Please provide email";
      }

      error('Forgot password send');
      forgotMailController!.text = "";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        error('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        error('Wrong password provided for that user.');
      }
    } catch (err) {
      if (err is String) {
        error(err);
      }
    }
  }

  void signIn() async {
    try {
      if (emailController != null && passwordController != null) {
        final email = emailController!.text;
        final password = passwordController!.text;
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        final String? id = userCredential.user?.uid;
        return fetchAccount(id);
      } else {
        throw "Please fill up all fields";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        error('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        error('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        error('Wrong email format');
      }
    } catch (err) {
      if (err is String) {
        error(err);
      }
    }
  }

  Future<void> fetchAccount(String? uid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (uid == null) {
      uid = prefs.getString(kCache);

      if (uid == null) {
        done();
        return;
      }
    }

    final user = await UserDao(id: uid).profile;
    final role = user.role;
    if (role != null) {
      if (role == "super" || role == "admin") {
        prefs.setString(kCache, uid);
        prefs.setString(kRole, role);

        login(user);

        return;
      } else {
        error("You are unauthorized to access this platform");
        throw "You are unauthorized to access this platform";
      }
    } else {
      error("You are unauthorized to access this platform");
      throw "You are unauthorized to access this platform";
    }
  }
}
