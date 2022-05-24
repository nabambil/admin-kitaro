import 'package:admin_kitaro/controller/user.dart';
import 'package:admin_kitaro/database/location_dao.dart';
import 'package:admin_kitaro/model/account/account_model.dart';
import 'package:admin_kitaro/model/location/location_model.dart';
import 'package:admin_kitaro/state/home.dart';
import 'package:admin_kitaro/utils/constant.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUser extends StatefulWidget {
  final KitaroAccount? model;
  final String? id;

  const AddUser({Key? key, required this.model, required this.id})
      : super(key: key);

  @override

  // ignore: no_logic_in_create_state
  State<AddUser> createState() => _AddUserState(model);
}

class _AddUserState extends State<AddUser> {
  late final UserController _controller;

  _AddUserState(KitaroAccount? model)
      : _controller = UserController(model: model);

  @override
  Widget build(BuildContext context) {
    final homeController = context.read<HomeControllerImp>();

    return widget.id == null
        ? Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding: const EdgeInsets.all(16),
            child: _userInfo(
              id: widget.id,
              controller: _controller,
              notifier: homeController,
            ),
          )
        : Scaffold(
            appBar: AppBar(title: Text(_controller.title(widget.id)), actions: [
              PopupMenuButton<String>(
                onSelected: (_) => _controller.delete(context, widget.id, () {
                  Navigator.pop(context);
                }),
                itemBuilder: (_) => [
                  const PopupMenuItem<String>(
                    value: 'Remove Account',
                    child: Text('Remove Account'),
                  )
                ],
              ),
            ]),
            body: ListView(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _userInfo(
                  id: widget.id,
                  controller: _controller,
                  notifier: homeController,
                  enabledEmail: false,
                ),
              ),
              _ListLocation(controller: _controller),
            ]),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: kWhite,
              label:
                  Text(_controller.actionTitle(widget.id), style: kThemeStyle),
              onPressed: () => _controller.action(widget.id, context, () {}),
            ),
          );
  }
}

// ignore: camel_case_types
class _userInfo extends StatelessWidget {
  final UserController _controller;
  final String? id;
  final bool enabledEmail;

  const _userInfo({
    Key? key,
    required this.id,
    required UserController controller,
    required HomeControllerImp notifier,
    this.enabledEmail = true,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (id == null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                _controller.title(id),
                style: kThemeStyleBold.copyWith(fontSize: 18),
              ),
            ),
          TextFormField(
            controller: _controller.name,
            focusNode: _controller.nodeName,
            decoration: const InputDecoration(label: Text("Name")),
            validator: _controller.nameValidator,
            onFieldSubmitted: (_) => _controller.nodeEmail.requestFocus(),
          ),
          TextFormField(
            controller: _controller.email,
            focusNode: _controller.nodeEmail,
            decoration: const InputDecoration(label: Text("Email")),
            validator: _controller.emailValidator,
            onFieldSubmitted: (_) => _controller.nodePassword.requestFocus(),
            enabled: enabledEmail,
          ),
          if (id == null)
            TextFormField(
              controller: _controller.password,
              focusNode: _controller.nodePassword,
              decoration: const InputDecoration(label: Text("Password")),
              validator: id == null ? _controller.passwordValidator : null,
              onFieldSubmitted: (_) =>
                  _controller.nodeConfirmation.requestFocus(),
            ),
          if (id == null)
            TextFormField(
              controller: _controller.confirmation,
              focusNode: _controller.nodeConfirmation,
              decoration:
                  const InputDecoration(label: Text("Confirmation Password")),
              validator: _controller.confirmationValidator,
              onFieldSubmitted: (_) => _controller.nodeConfirmation.unfocus(),
            ),
          if (id == null) const Spacer(),
          if (id == null)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _controller.dismiss(context, null),
                  child: const Text("CANCEL", style: kGreyStyle),
                ),
                TextButton(
                  onPressed: () => _controller.action(id, context, () {}),
                  child: Text(
                    _controller.actionTitle(id),
                    style: kThemeStyleBold,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _ListLocation extends StatefulWidget {
  final UserController controller;
  const _ListLocation({Key? key, required this.controller}) : super(key: key);

  @override
  State<_ListLocation> createState() => __ListLocationState();
}

class __ListLocationState extends State<_ListLocation> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, LocationModel>>(
        future: LocationDao().locations,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Widget> children = [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Managing Location",
                  style: kWhiteStyleBold.copyWith(fontSize: 18),
                ),
              )
            ];
            children.addAll(snapshot.data!.entries
                .map(
                  (e) => _Tile(
                    location: e.value,
                    id: e.key,
                    controller: widget.controller,
                    selected: widget.controller.checkManagingLocation(e.key),
                    onTap: (value) =>
                        setState(() => widget.controller.setLocation(value)),
                  ),
                )
                .toList());
            return Container(
              decoration: const BoxDecoration(
                color: kThemeColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
              ),
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children),
            );
          }
          return Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: const Center(child: CircularProgressIndicator()),
          );
        });
  }
}

class _Tile extends StatelessWidget {
  final UserController controller;
  final LocationModel location;
  final String id;
  final bool selected;
  final Function(String?) onTap;

  const _Tile({
    Key? key,
    required this.location,
    required this.controller,
    required this.selected,
    required this.onTap,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: CheckboxListTile(
        value: selected,
        activeColor: kThemeColor,
        onChanged: (value) => onTap(id),
        title: Text(location.name ?? "", style: const TextStyle(color: kBlack)),
      ),
    );
  }
}
