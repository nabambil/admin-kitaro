import 'package:admin_kitaro/state/drawer.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildTitle extends StatelessWidget {
  const BuildTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<DrawerState>().when(
          home: (x) => title(x),
          user: (x) => title(x),
          type: (x) => title(x),
          location: (x) => title(x),
        );
  }

  Widget title(Map<String, IconData> text) =>
      Text(text.keys.first, style: kWhiteStyleBold.copyWith(fontSize: 18));
}
