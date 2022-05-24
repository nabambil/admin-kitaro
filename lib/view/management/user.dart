import 'package:admin_kitaro/model/account/account_model.dart';
import 'package:admin_kitaro/state/home.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:admin_kitaro/view/create/add_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/splash.dart';

class UserManagementList extends StatefulWidget {
  final Map<String, KitaroAccount> result;
  const UserManagementList({Key? key, required this.result}) : super(key: key);

  @override
  State<UserManagementList> createState() => _UserManagementListState();
}

class _UserManagementListState extends State<UserManagementList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kThemeColor,
      height: double.infinity,
      width: double.infinity,
      child: RefreshIndicator(
        onRefresh: () async {
          final homeController = context.read<HomeControllerImp>();
          Future(() => homeController.loading());
          Future(() => homeController.getUserList());
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12),
          children: widget.result.entries
              .map<_Tile>((e) => _Tile(acc: e.value, id: e.key))
              .toList(),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final KitaroAccount acc;
  final String id;
  const _Tile({Key? key, required this.acc, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: const BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: kThemeColorDarker,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
          title: Text(
            acc.firstName ?? "",
            style: const TextStyle(color: kThemeColorDarker),
          ),
          trailing: const Icon(
            Icons.arrow_right_alt_outlined,
            color: kThemeColorDarker,
          ),
          onTap: () {
            context
                .read<SplashController>()
                .navigate(
                  context,
                  AddUser(id: id, model: acc),
                )
                .then((_) {
              final value = context.read<HomeControllerImp>();
              Future(() => value.loading());
              Future(() => value.getUserList());
            });
          }),
    );
  }
}
