import 'package:admin_kitaro/state/drawer.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:admin_kitaro/view/components/home/homeContent.dart';
import 'package:admin_kitaro/view/components/home/homeFloatingButtons.dart';
import 'package:admin_kitaro/view/components/home/homeIconTitle.dart';
import 'package:admin_kitaro/view/components/home/homeTitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kThemeColor,
          shadowColor: kThemeColor,
          elevation: 0,
          title: Image.asset(
            "asset/kitaro_logo_main.png",
            fit: BoxFit.fitHeight,
            width: 100,
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size(0, 60),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  BuildTitleIcon(),
                  SizedBox(width: 12),
                  BuildTitle(),
                  SizedBox(width: 6),
                  Icon(Icons.home, color: kThemeColor, size: 28),
                ],
              ),
            ),
          ),
        ),
        drawer: const kDrawer(),
        body: const BuildContent(),
        floatingActionButton: context.watch<DrawerState>().maybeWhen(
              home: (_) => null,
              orElse: () => const BuildButton(),
            ),
      ),
    );
  }
}
