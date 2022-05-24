import 'package:admin_kitaro/state/drawer.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildTitleIcon extends StatelessWidget {
  const BuildTitleIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Icon(currentIcon, color: kWhite, size: 28),
    return context.watch<DrawerState>().when(
          home: (x) => icon(x),
          user: (x) => icon(x),
          type: (x) => icon(x),
          location: (x) => icon(x),
        );
  }

  Widget icon(Map<String, IconData> icon) =>
      Icon(icon.values.first, color: kWhite, size: 28);
}
