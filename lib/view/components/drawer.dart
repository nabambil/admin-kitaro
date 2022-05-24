import 'package:admin_kitaro/controller/splash.dart';
import 'package:admin_kitaro/state/drawer.dart';
import 'package:admin_kitaro/state/session.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class kDrawer extends StatelessWidget {
  const kDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DrawerNotifier? imp = context.watch<DrawerNotifier>();

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: kThemeColor, //desired color
      ),
      child: Drawer(
        child: context.read<SessionState>().when(
            initial: (acc) => Column(
                  children: [
                    const _Header(),
                    ListTile(
                      title: const Text('Home', style: kWhiteStyle),
                      leading: const Icon(Icons.home, color: kWhite),
                      onTap: () => imp.home(context),
                    ),
                    if (acc.role == "super")
                      ListTile(
                        title:
                            const Text('User Management', style: kWhiteStyle),
                        leading: const Icon(Icons.person, color: kWhite),
                        onTap: () => imp.user(context),
                      ),
                    if (acc.role == "super")
                      ListTile(
                        title: const Text('Waste Type Management',
                            style: kWhiteStyle),
                        leading: const Icon(Icons.workspaces_outlined,
                            color: kWhite),
                        onTap: () => imp.type(context),
                      ),
                    if (acc.role == "super" || acc.role == "admin")
                      ListTile(
                        title: const Text('Location Management',
                            style: kWhiteStyle),
                        leading: const Icon(Icons.location_on, color: kWhite),
                        onTap: () => imp.location(context),
                      ),
                    // if (acc.role == "super")
                    //   ListTile(
                    //     title: const Text('Item 1', style: kWhiteStyle),
                    //     leading: const Icon(Icons.home, color: kWhite),
                    //     onTap: () {},
                    //   ),
                    const Spacer(),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: FutureBuilder<PackageInfo>(
                            future: PackageInfo.fromPlatform(),
                            builder: (_, snapshot) => Text(
                                  "version " +
                                      (snapshot.data?.version ?? "x.x.x"),
                                  style: kWhiteStyle,
                                )))
                  ],
                ),
            dismiss: () {
              return Container();
            }),
      ),
    );
  }
}

@protected
class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      child: context.read<SessionState>().when(
            initial: (acc) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Image.asset(
                    "asset/kitaro_logo_main.png",
                    fit: BoxFit.fitHeight,
                    width: 100,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    acc.firstName ?? "",
                    style: kWhiteStyleBold.copyWith(fontSize: 20),
                  ),
                  subtitle: Text(
                    (acc.role ?? "").toUpperCase(),
                    style: kWhiteStyle.copyWith(fontSize: 18),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.exit_to_app, color: kWhite),
                    onPressed: () =>
                        context.read<SplashController>().logout(context),
                  ),
                ),
              ],
            ),
            dismiss: () => null,
          ),
    );
  }
}
