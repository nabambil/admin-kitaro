import 'package:admin_kitaro/state/drawer.dart';
import 'package:admin_kitaro/state/home.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:admin_kitaro/view/create/add_location.dart';
import 'package:admin_kitaro/view/create/add_user.dart';
import 'package:admin_kitaro/view/create/add_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: kWhite,
      label: context.watch<DrawerState>().when(
            home: (x) => const Text("User"),
            user: (x) => const Text("User", style: kThemeStyleBold),
            type: (x) => const Text("Type", style: kThemeStyleBold),
            location: (x) => const Text("Location", style: kThemeStyleBold),
          ),
      icon: const Icon(Icons.add, color: kThemeColor),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: context.watch<DrawerState>().when(
                      home: (x) => Container(),
                      user: (x) => const AddUser(id: null, model: null),
                      type: (x) => const AddWasteType(id: null, model: null),
                      location: (x) => const AddLocation(id: null, model: null),
                    ),
              );
            }).then((_) => context.read<DrawerState>().when(
              home: (x) => Container(),
              user: (x) {
                final homeController = context.read<HomeControllerImp>();
                Future(() => homeController.loading());
                Future(() => homeController.getUserList());
              },
              type: (x) {
                final homeController = context.read<HomeControllerImp>();
                Future(() => homeController.loading());
                Future(() => homeController.getTypeList());
              },
              location: (x) {
                final homeController = context.read<HomeControllerImp>();
                Future(() => homeController.loading());
                Future(() => homeController.getLocationist());
              },
            ));
      },
    );
  }
}
