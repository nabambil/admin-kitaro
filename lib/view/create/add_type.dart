import 'package:admin_kitaro/database/waste_dao.dart';
import 'package:admin_kitaro/model/waste/waste_model.dart';
import 'package:admin_kitaro/state/drawer.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddWasteType extends StatefulWidget {
  final WasteModel? model;
  final String? id;

  const AddWasteType({Key? key, required this.model, required this.id})
      : super(key: key);

  @override

  // ignore: no_logic_in_create_state
  State<AddWasteType> createState() => _AddWasteTypeState(model);
}

class _AddWasteTypeState extends State<AddWasteType> {
  late final _Controller _controller;

  _AddWasteTypeState(WasteModel? model)
      : _controller = _Controller(model: model);

  @override
  Widget build(BuildContext context) {
    final DrawerNotifier _homeController = context.read<DrawerNotifier>();

    return Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _controller.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                _controller.title(widget.id),
                style: kThemeStyleBold.copyWith(fontSize: 18),
              ),
            ),
            TextFormField(
              controller: _controller.desc,
              focusNode: _controller.nodeDesc,
              decoration: const InputDecoration(label: Text("Description")),
              validator: _controller.descriptionValidator,
              onFieldSubmitted: (_) {
                _controller.nodeName.requestFocus();
              },
            ),
            TextFormField(
              controller: _controller.name,
              focusNode: _controller.nodeName,
              decoration: const InputDecoration(label: Text("Name")),
              validator: _controller.nameValidator,
              onFieldSubmitted: (_) {
                _controller.nodeEmission.requestFocus();
              },
            ),
            TextFormField(
              controller: _controller.emission,
              focusNode: _controller.nodeEmission,
              decoration: const InputDecoration(label: Text("Emission")),
              validator: _controller.emissionValidator,
              onFieldSubmitted: (_) {
                _controller.nodeEmission.unfocus();
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                if (widget.id != null)
                  TextButton(
                    onPressed: () => _controller.delete(
                      context,
                      widget.id,
                      () => _homeController.type(context),
                    ),
                    child: const Text("REMOVE", style: kRedStyle),
                  ),
                const Spacer(),
                TextButton(
                  onPressed: () => _controller.dismiss(context, null),
                  child: const Text("CANCEL", style: kGreyStyle),
                ),
                TextButton(
                  onPressed: () => _controller.action(
                    widget.id,
                    context,
                    () => _homeController.type(context),
                  ),
                  child: Text(
                    _controller.actionTitle(widget.id),
                    style: kThemeStyleBold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Controller {
  WasteModel? model;

  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _emission = TextEditingController();
  final _description = TextEditingController();

  final FocusNode nodeDesc = FocusNode();
  final FocusNode nodeName = FocusNode();
  final FocusNode nodeEmission = FocusNode();

  get key => _formKey;
  get name => _name;
  get emission => _emission;
  get desc => _description;

  _Controller({required this.model}) {
    model ??= const WasteModel();

    if (model != null) {
      final String? description = model!.desc;
      final String? name = model!.name;
      final double? emission = model!.emission;

      _description.text = description ?? "";
      _name.text = name ?? "";
      _emission.text = (emission?.toString() ?? "");
    }

    _name.addListener(() => model = model?.copyWith(name: _name.text));
    _emission.addListener(() {
      final value = double.tryParse(_emission.text);
      if (value != null) {
        model = model?.copyWith(emission: value);
      }
    });
    _description.addListener(
      () => model = model?.copyWith(desc: _description.text),
    );
  }

  String title(String? value) {
    if (value == null) {
      return "New Waste Type";
    }

    return "Update Waste Type";
  }

  String actionTitle(String? value) {
    if (value == null) {
      return "ADD";
    }

    return "UPDATE";
  }

  // -- VALIDATION
  String? descriptionValidator(String? value) {
    if ((value ?? "").isEmpty) {
      nodeDesc.requestFocus();
      return "Please enter type description";
    }
    return null;
  }

  String? nameValidator(String? value) {
    if ((value ?? "").isEmpty) {
      nodeName.requestFocus();
      return "Please enter type name";
    }
    return null;
  }

  String? emissionValidator(String? value) {
    if ((value ?? "").isEmpty) {
      nodeEmission.requestFocus();
      return "Please enter type emission";
    }
    if (double.tryParse(value!) == null) {
      nodeEmission.requestFocus();
      return "Please enter valid emission amount";
    }
    return null;
  }

  // -- ACTION
  void action(String? id, BuildContext context, Function refresh) {
    if (_formKey.currentState!.validate()) {
      if (id == null) {
        _showDialog(context, "Do you confirm want to ADD?", () {
          WasteDao()
              .add(model!)
              .then((value) => dismiss(context, refresh))
              .catchError((err) => dismiss(context, refresh));
        });
      } else {
        _showDialog(context, "Do you confirm want to UPDATE?", () {
          WasteDao(id: id)
              .update(model!)
              .then((value) => dismiss(context, refresh))
              .catchError((err) => dismiss(context, refresh));
        });
      }
    }
  }

  void delete(BuildContext context, String? id, Function refresh) {
    if (id != null) {
      _showDialog(context, "Do you confirm want to DELETE?", () {
        return WasteDao(id: id)
            .remove()
            .then((value) => dismiss(context, refresh))
            .catchError((err) => dismiss(context, refresh));
      });
    }
  }

  // -- DIALOG

  void _showDialog(BuildContext context, String content, Function action) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          "Alert",
          style: kRedStyleBold,
        ),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              dismiss(context, null).then((value) => dismiss(context, null));
            },
            child: const Text("Cancel", style: kGreyStyle),
          ),
          TextButton(
            onPressed: () => action(),
            child: const Text("Confirm", style: kThemeStyle),
          )
        ],
      ),
    );
  }

  Future<void> dismiss(BuildContext context, Function? refresh) async {
    if (refresh != null) {
      refresh();
    }

    Navigator.pop(context);

    return;
  }
}
