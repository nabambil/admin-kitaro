// ignore: file_names

import 'package:admin_kitaro/database/user_dao.dart';
import 'package:admin_kitaro/database/waste_dao.dart';
import 'package:admin_kitaro/model/account/account_model.dart';
import 'package:admin_kitaro/model/location/location_model.dart';
import 'package:admin_kitaro/database/location_dao.dart';
import 'package:admin_kitaro/model/waste/waste_model.dart';
import 'package:admin_kitaro/state/session.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:admin_kitaro/view/home.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.initial(Map<String, LocationModel> locations) =
      _Initial;
  const factory HomeState.home(Map<String, LocationModel> values) = _Home;
  const factory HomeState.type(Map<String, WasteModel> values) = _Type;
  const factory HomeState.users(Map<String, KitaroAccount> values) = _Users;
}

abstract class HomeController extends StateNotifier<HomeState>
    with LocatorMixin {
  HomeController() : super(const HomeState.initial({}));

  void reloadHome(Map<String, LocationModel> list) {
    state = HomeState.home(list);
  }

  void reloadLocation(Map<String, LocationModel> list) {
    state = HomeState.initial(list);
  }
}

class HomeControllerImp extends HomeController {
  HomeControllerImp() {
    getHomeList();
  }

  void loading() => state = const HomeState.loading();

  void getHomeList() {
    SharedPreferences.getInstance().then((value) async {
      final role = value.getString(kRole);
      if (role == "admin") {
        final Map<String, LocationModel> list = {};
        final KitaroAccount? acc =
            read<SessionState>().whenOrNull(initial: (acc) => acc);
        if (acc != null) {
          final managers = acc.managers;
          if (managers != null) {
            for (final location in managers) {
              final result = await LocationDao(id: location).location;
              list[location] = result;
            }
          }
        }

        reloadHome(list);
      } else if (role == "super") {
        LocationDao().locations.then((value) {
          reloadHome(value);
        });
      }
    });
  }

  void getLocationist() {
    SharedPreferences.getInstance().then((value) async {
      final role = value.getString(kRole);
      if (role == "admin") {
        final Map<String, LocationModel> list = {};
        final KitaroAccount? acc =
            read<SessionState>().whenOrNull(initial: (acc) => acc);
        if (acc != null) {
          final managers = acc.managers;
          if (managers != null) {
            for (final location in managers) {
              final result = await LocationDao(id: location).location;
              list[location] = result;
            }
          }
        }

        reloadLocation(list);
      } else if (role == "super") {
        LocationDao().locations.then((value) {
          reloadLocation(value);
        });
      }
    });
  }

  void getUserList() async {
    final users = await UserDao().users;
    users.removeWhere((key, value) => value.role != "admin");

    state = HomeState.users(users);
  }

  void getTypeList() async {
    WasteDao().wastes.then((value) => state = HomeState.type(value));
  }
}

class HomeProvider {
  static Provider<HomeControllerImp> createProvider() =>
      Provider<HomeControllerImp>(
        create: (_) => HomeControllerImp(),
      );

  static StateNotifierProvider<HomeControllerImp, HomeState> create() {
    return StateNotifierProvider<HomeControllerImp, HomeState>(
      create: (_) => HomeControllerImp(),
      child: const Homepage(),
    );
  }
}
