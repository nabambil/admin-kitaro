import 'package:admin_kitaro/state/home.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:admin_kitaro/view/handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_kitaro/controller/splash.dart';
import 'package:admin_kitaro/state/stateController.dart';

class StateView extends StatefulWidget {
  const StateView({Key? key}) : super(key: key);

  @override
  _StateViewState createState() => _StateViewState();
}

class _StateViewState extends State<StateView> {
  late StateController state;
  late SplashController controller;
  bool firstTime = false;
  @override
  void dispose() {
    super.dispose();

    final controller = context.watch<SplashController>();
    controller.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    state = context.watch<StateController>();
    controller = context.watch<SplashController>();

    controller.initiateField();

    Handler.toastHandler(state, context);
    if (firstTime == false) {
      controller.fetchAccount(null).then((value) => firstTime = true);
    }

    state.maybeWhen(
      logout: () {
        controller.initiateField();
      },
      login: (_) {
        controller.navigate(context, HomeProvider.create());
        controller.clear();
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return state.maybeWhen(
      loading: () => Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: kThemeColor,
          child: Center(
            child: Image.asset(
              "asset/kitaro_logo_main.png",
              fit: BoxFit.fitHeight,
              width: 250,
            ),
          ),
        ),
      ),
      orElse: () => Scaffold(
        appBar: AppBar(
          backgroundColor: kWhite,
          shadowColor: kWhite,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size(0, 30),
            child: SizedBox(
              height: 60,
              child: Image.asset(
                "asset/kitaro_logo_main.png",
                color: kThemeColor,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        body: Container(
          color: kWhite,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: _content(),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SplashController>();
    final state = context.watch<StateController>();

    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: controller.emailController,
            focusNode: controller.node1,
            decoration: const InputDecoration(
              label: Text("Email"),
              hintText: "kitaro@mail.com",
            ),
            validator: controller.mailValidator,
            onFieldSubmitted: (_) {
              controller.node2?.requestFocus();
            },
          ),
          TextFormField(
            controller: controller.passwordController,
            focusNode: controller.node2,
            decoration: InputDecoration(
              label: const Text("Password"),
              hintText: "*********",
              suffixIcon: IconButton(
                icon: Icon(
                  controller.obsecureVisible
                      ? CupertinoIcons.eye_fill
                      : CupertinoIcons.eye_slash_fill,
                ),
                onPressed: controller.viewPassword,
              ),
            ),
            validator: controller.passwordValidator,
            onFieldSubmitted: (_) {
              controller.node1?.unfocus();
              controller.tryLogin();
            },
            obscureText: controller.obsecureVisible,
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: state.maybeWhen(
                loading: null, orElse: () => controller.tryLogin),
            child: Text(
              state.maybeWhen(loading: () => 'Loading', orElse: () => 'Login'),
            ),
            style: ElevatedButton.styleFrom(primary: kThemeColor),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => _forgotDialog(controller: controller),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                child: Text("Forgot Password"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _forgotDialog extends StatelessWidget {
  final SplashController controller;

  const _forgotDialog({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:
          const Text("Forgot Password", style: TextStyle(color: kThemeColor)),
      content: Form(
        key: controller.formKeyForgot,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controller.forgotMailController,
              decoration: const InputDecoration(
                label: Text("Email"),
                hintText: "kitaro@mail.com",
              ),
              validator: controller.mailValidator,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            controller.clear();
            Navigator.pop(context);
          },
          child:
              Text("Cancel", style: TextStyle(color: kBlack.withOpacity(0.3))),
        ),
        TextButton(
          onPressed: () {
            if (controller.formKeyForgot.currentState!.validate()) {
              Navigator.pop(context);
              controller.reset();
            }
          },
          child: const Text("Continue", style: TextStyle(color: kThemeColor)),
        ),
      ],
    );
  }
}
