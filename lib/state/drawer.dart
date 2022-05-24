// ignore: file_names

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home.dart';

part 'drawer.freezed.dart';

@freezed
abstract class DrawerState with _$DrawerState {
  const factory DrawerState.home(Map<String, IconData> value) = _Home;
  const factory DrawerState.user(Map<String, IconData> value) = _User;
  const factory DrawerState.type(Map<String, IconData> value) = _Type;
  const factory DrawerState.location(Map<String, IconData> value) = _Location;
}

class DrawerNotifier extends StateNotifier<DrawerState> with LocatorMixin {
  DrawerNotifier() : super(const DrawerState.home({"HOME": Icons.home}));

  void home(BuildContext context) {
    final controller = context.read<HomeControllerImp>();
    controller.getHomeList();
    state = const DrawerState.home({"HOME": Icons.home});
    Navigator.pop(context);
  }

  void user(BuildContext context) {
    final controller = context.read<HomeControllerImp>();
    controller.getUserList();
    state = const DrawerState.user({"USER MANAGEMENT": Icons.person});
    Navigator.pop(context);
  }

  void userRefresh(BuildContext context) {
    final controller = context.read<HomeControllerImp>();
    controller.getUserList();
    state = const DrawerState.user({"USER MANAGEMENT": Icons.person});
  }

  void type(BuildContext context) {
    final controller = context.read<HomeControllerImp>();
    controller.getTypeList();
    state =
        const DrawerState.type({"TYPE MANAGEMENT": Icons.workspaces_outlined});
    Navigator.pop(context);
  }

  void location(BuildContext context) {
    final controller = context.read<HomeControllerImp>();
    controller.getLocationist();
    state =
        const DrawerState.location({"LOCATION MANAGEMENT": Icons.location_on});
    Navigator.pop(context);
  }
}

class DrawerProvider {
  static Provider<DrawerNotifier> createProvider() => Provider<DrawerNotifier>(
        create: (_) => DrawerNotifier(),
      );

  static StateNotifierProvider<DrawerNotifier, DrawerState> create() {
    return StateNotifierProvider<DrawerNotifier, DrawerState>(
      create: (_) => DrawerNotifier(),
    );
  }
}
