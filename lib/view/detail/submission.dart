import 'package:admin_kitaro/model/location/location_model.dart';
import 'package:admin_kitaro/model/recycle/recycle_model.dart';
import 'package:admin_kitaro/state/detail.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final LocationModel? model;
  final String? id;
  const DetailScreen({Key? key, required this.model, required this.id})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<DetailScreen> createState() => _DetailScreenState(id, model);
}

class _DetailScreenState extends State<DetailScreen> {
  late DetailControllerImp controller;
  late DetailState state;
  late String? title;

  _DetailScreenState(String? id, LocationModel? model);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = context.watch<DetailState>();
    controller = context.read<DetailControllerImp>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model?.name ?? ""),
        actions: [
          IconButton(
            onPressed: () => controller.filter(context),
            icon: const Icon(Icons.calendar_month),
          )
        ],
      ),
      body: ListView(
        children: ListTile.divideTiles(
          color: Colors.deepPurple,
          tiles: state.maybeWhen(
            orElse: () => [
              SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: const Text("Loading ..."),
              )
            ],
            initial: (values) => values.isEmpty
                ? [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 100,
                      child: const Center(child: Text("No data to display")),
                    )
                  ]
                : values.map((e) => CustomTile(model: e)).toList(),
            load: (values) => values.isEmpty
                ? [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 100,
                      child: const Center(child: Text("No data to display")),
                    )
                  ]
                : values.map((e) => CustomTile(model: e)).toList(),
          ),
        ).toList(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(
      //     Icons.outbox,
      //     color: kWhite,
      //   ),
      //   backgroundColor: kThemeColor,
      //   onPressed: controller.export,
      // ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final RecycleModel model;
  const CustomTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                (model.type ?? ''),
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(model.weight.toString() + " KG"),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.datetime.toString().format(),
            ),
            Text(model.username ?? ""),
          ],
        ),
      ),
    );
  }
}
