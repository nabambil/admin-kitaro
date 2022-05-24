import 'package:admin_kitaro/controller/splash.dart';
import 'package:admin_kitaro/model/location/location_model.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryLocationList extends StatelessWidget {
  final Map<String, LocationModel> result;
  const HistoryLocationList({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kThemeColor,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: result.entries
            .map((e) => _Tile(location: e.value, id: e.key))
            .toList(),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final LocationModel location;
  final String id;
  const _Tile({Key? key, required this.location, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: kWhite.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 6,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
          title: Text(
            location.name ?? "",
            style: const TextStyle(color: kBlack),
          ),
          trailing: const Icon(Icons.arrow_right_alt_outlined, color: kBlack),
          onTap: () {
            context
                .read<SplashController>()
                .navigateDetail(context, location, id);
          }),
    );
  }
}
