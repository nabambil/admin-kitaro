import 'package:admin_kitaro/state/home.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:admin_kitaro/view/management/history.dart';
import 'package:admin_kitaro/view/management/location.dart';
import 'package:admin_kitaro/view/management/type.dart';
import 'package:admin_kitaro/view/management/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildContent extends StatelessWidget {
  const BuildContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeState = context.watch<HomeState>();

    return homeState.when(
      loading: () => Container(
        color: kThemeColor,
        child: const Center(child: CircularProgressIndicator()),
        height: double.infinity,
        width: double.infinity,
      ),
      initial: (data) => LocationManagementList(result: data),
      home: (data) => HistoryLocationList(result: data),
      users: (data) => UserManagementList(result: data),
      type: (data) => TypeManagementList(result: data),
    );
  }
}
