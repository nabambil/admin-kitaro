import 'package:admin_kitaro/model/waste/waste_model.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:admin_kitaro/view/create/add_type.dart';
import 'package:flutter/material.dart';

class TypeManagementList extends StatelessWidget {
  final Map<String, WasteModel> result;
  const TypeManagementList({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kThemeColor,
      height: double.infinity,
      width: double.infinity,
      child: ListView(
        padding: const EdgeInsets.only(top: 12, bottom: 80),
        children: result.entries
            .map<_Tile>((e) => _Tile(model: e.value, id: e.key))
            .toList(),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final WasteModel model;
  final String id;
  const _Tile({Key? key, required this.model, required this.id})
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
            model.name ?? "",
            style: const TextStyle(color: kBlack),
          ),
          trailing: const Icon(Icons.arrow_right_alt_outlined, color: kBlack),
          onTap: () {
            showBottomSheet(
              context: context,
              builder: (_) => AddWasteType(id: id, model: model),
            );
          }),
    );
  }
}
