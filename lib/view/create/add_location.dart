import 'package:admin_kitaro/controller/address.dart';
import 'package:admin_kitaro/controller/location.dart';
import 'package:admin_kitaro/database/waste_dao.dart';
import 'package:admin_kitaro/model/location/location_model.dart';
import 'package:admin_kitaro/model/waste/waste_model.dart';
import 'package:admin_kitaro/utils/constant.dart';

import 'package:flutter/material.dart';

class AddLocation extends StatefulWidget {
  final LocationModel? model;
  final String? id;

  const AddLocation({
    Key? key,
    required this.model,
    required this.id,
  }) : super(key: key);

  @override

  // ignore: no_logic_in_create_state
  State<AddLocation> createState() => _AddLocationState(model);
}

class _AddLocationState extends State<AddLocation>
    with TickerProviderStateMixin {
  late final LocationController _controller;
  AddressController? _addressController;

  final GlobalKey<FormState> _openingKey =
      GlobalKey<FormState>(debugLabel: "_openingFormState");

  final GlobalKey<FormState> _formInfoKey =
      GlobalKey<FormState>(debugLabel: "_infoFormState");

  final GlobalKey<FormState> _addressKey =
      GlobalKey<FormState>(debugLabel: "_addressFormState");

  TabController? tabController;

  _AddLocationState(LocationModel? model)
      : _controller = LocationController(model) {
    _controller.address.then((value) => AddressController(value)).then((value) {
      setState(() => _addressController = value);
    }).catchError((err) {
      setState(() => _addressController = AddressController(null));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _addressController?.dispose();
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.id == null) {
      return Container(
        height: 450,
        padding: const EdgeInsets.all(16),
        child: _locationInfo(
          id: widget.id,
          controller: _controller,
          formKey: _formInfoKey,
        ),
      );
    }

    tabController ??= TabController(length: 4, vsync: this);

    return Scaffold(
      appBar: AppBar(
        title: Text(_controller.title(widget.id)),
        actions: [
          PopupMenuButton<String>(
            onSelected: (_) {
              _controller.delete(context, widget.id);
            },
            itemBuilder: (_) => [
              const PopupMenuItem<String>(
                value: 'Remove Location',
                child: Text('Remove Location'),
              )
            ],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 40),
          child: IgnorePointer(
            child: TabBar(
              isScrollable: true,
              indicatorColor: kWhite,
              controller: tabController,
              tabs: const [
                Tab(text: "Info"),
                Tab(text: "Address"),
                Tab(text: "Operating"),
                Tab(text: "Type"),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          // ],)
          //  ListView(children: [

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _locationInfo(
              id: widget.id,
              controller: _controller,
              formKey: _formInfoKey,
            ),
          ),
          if (_addressController == null) Container(),
          if (_addressController != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _addressInfo(
                id: widget.id,
                controller: _addressController!,
                updateAddress: _controller.setAddress,
                formKey: _addressKey,
              ),
            ),
          if (_addressController == null) Container(),
          if (_addressController != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _operatingInfo(
                id: widget.id,
                controller: _addressController!,
                formKey: _openingKey,
              ),
            ),
          _ListLocation(controller: _controller),
        ],
      ),
      floatingActionButton: (tabController?.index ?? 0) == 3
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 30),
                if (tabController!.index > 0)
                  FloatingActionButton.extended(
                    backgroundColor: kWhite,
                    label: const Text("Back", style: kThemeStyle),
                    onPressed: buttonBack,
                  ),
                const Spacer(),
                FloatingActionButton.extended(
                  backgroundColor: kWhite,
                  label: Text(_controller.actionTitle(widget.id),
                      style: kThemeStyle),
                  onPressed: buttonOnPressed,
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 30),
                if (tabController!.index > 0)
                  FloatingActionButton.extended(
                    backgroundColor: kWhite,
                    label: const Text("Back", style: kThemeStyle),
                    onPressed: buttonBack,
                  ),
                const Spacer(),
                FloatingActionButton.extended(
                  backgroundColor: kWhite,
                  label: const Text("Next", style: kThemeStyle),
                  onPressed: buttonNext,
                ),
              ],
            ),
    );
  }

  void buttonNext() {
    if (tabController == null) {
      return;
    }

    final index = tabController!.index;
    bool proceed = false;
    List<GlobalKey<FormState>> formStates = [];
    setState(() {});
    if (index == 0) {
      formStates.add(_formInfoKey);
    } else if (index == 1) {
      formStates.add(_addressKey);
    } else if (index == 2) {
      formStates.add(_openingKey);
    }

    final pass1 = _addressController!.checkState(formStates);
    final pass2 = _addressController!.validateFieldChecking(formStates);

    proceed = pass1 && pass2;

    if (index < 4 && proceed) tabController!.animateTo(index + 1);
  }

  void buttonBack() {
    if (tabController == null) {
      return;
    }

    final index = tabController!.index;

    setState(() {});

    if (index > 0) {
      tabController!.animateTo(index - 1);
    } else {
      Navigator.pop(context);
    }
  }

  void buttonOnPressed() {
    _controller.updateDialog(
      context,
      () => _addressController?.action(widget.model?.address).then((value) {
        if (value != null) {
          _controller.setAddress(value);
        }
        _controller.action(widget.id, context);
      }),
    );
  }
}

// ignore: camel_case_types
class _locationInfo extends StatefulWidget {
  final String? id;
  final LocationController controller;
  final GlobalKey<FormState> formKey;

  const _locationInfo(
      {Key? key,
      required this.id,
      required this.controller,
      required this.formKey})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<_locationInfo> createState() => _locationInfoState(controller, formKey);
}

// ignore: camel_case_types
class _locationInfoState extends State<_locationInfo> {
  final LocationController _controller;
  final GlobalKey<FormState> formKey;
  _locationInfoState(this._controller, this.formKey);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.id == null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                _controller.title(widget.id),
                style: kThemeStyleBold.copyWith(fontSize: 18),
              ),
            ),
          TextFormField(
            controller: _controller.name,
            focusNode: _controller.nameNode,
            decoration: const InputDecoration(label: Text("Name")),
            validator: (value) => _controller.checkNullValidator(value, "Name"),
            onFieldSubmitted: (_) => _controller.directionNode.requestFocus(),
          ),
          TextFormField(
            controller: _controller.direction,
            focusNode: _controller.directionNode,
            decoration: const InputDecoration(label: Text("Google Map Link")),
            validator: (v) => _controller.checkNullValidator(v, "Direction"),
            onFieldSubmitted: (_) => _controller.directionNode.unfocus(),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text("Is Weight?"),
          ),
          Row(
            children: ["Yes", "No"]
                .map((e) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(
                          e,
                          style: _controller.isWeightSelected(e)
                              ? kWhiteStyle
                              : kThemeStyle,
                        ),
                        selected: _controller.isWeightSelected(e),
                        selectedColor: kThemeColor,
                        onSelected: (_) =>
                            setState(() => _controller.setIsWeight()),
                      ),
                    ))
                .toList(),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text("Facilities Type ?"),
          ),
          Row(
              children: _controller.facilities.entries
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(
                          e.value,
                          style: _controller.facilitiesSelected(e.key)
                              ? kWhiteStyle
                              : kThemeStyle,
                        ),
                        selected: _controller.facilitiesSelected(e.key),
                        selectedColor: kThemeColor,
                        onSelected: (_) => setState(
                          () => _controller.setFacilities(e.key),
                        ),
                      ),
                    ),
                  )
                  .toList()),
          if (widget.id == null) const Spacer(),
          if (widget.id == null)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _controller.dismiss(context),
                  child: const Text("CANCEL", style: kGreyStyle),
                ),
                TextButton(
                  onPressed: () => _controller.action(widget.id, context),
                  child: Text(
                    _controller.actionTitle(widget.id),
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

class _addressInfo extends StatelessWidget {
  final AddressController _controller;
  final Function(String) updateAddress;
  final String? id;
  final GlobalKey<FormState> formKey;

  const _addressInfo({
    Key? key,
    required this.id,
    required AddressController controller,
    required this.updateAddress,
    required this.formKey,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 60),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (id == null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "Set Address",
                  style: kThemeStyleBold.copyWith(fontSize: 18),
                ),
              ),
            TextFormField(
              controller: _controller.address1,
              focusNode: _controller.address1Node,
              decoration: const InputDecoration(label: Text("Address 1")),
              validator: (v) => _controller.checkNullValidator(v, "Address 1"),
              onFieldSubmitted: (_) => _controller.address2Node.requestFocus(),
            ),
            TextFormField(
              controller: _controller.address2,
              focusNode: _controller.address2Node,
              decoration: const InputDecoration(label: Text("Address 2")),
              onFieldSubmitted: (_) => _controller.address3Node.requestFocus(),
            ),
            TextFormField(
              controller: _controller.address3,
              focusNode: _controller.address3Node,
              decoration: const InputDecoration(label: Text("Address 3")),
              onFieldSubmitted: (_) => _controller.cityNode.requestFocus(),
            ),
            TextFormField(
              controller: _controller.city,
              focusNode: _controller.cityNode,
              decoration: const InputDecoration(label: Text("City")),
              validator: (v) => _controller.checkNullValidator(v, "City"),
              onFieldSubmitted: (_) => _controller.postcodeNode.unfocus(),
            ),
            TextFormField(
              controller: _controller.postcode,
              focusNode: _controller.postcodeNode,
              decoration: const InputDecoration(label: Text("Postcode")),
              validator: (v) => _controller.checkIntValidator(v, "Postcode"),
              onFieldSubmitted: (_) => _controller.stateNode.unfocus(),
            ),
            TextFormField(
              controller: _controller.state,
              focusNode: _controller.stateNode,
              decoration: const InputDecoration(label: Text("State")),
              validator: (v) => _controller.checkNullValidator(v, "State"),
              onFieldSubmitted: (_) => _controller.stateNode.unfocus(),
            ),
          ],
        ),
      ),
    );
  }
}

class _operatingInfo extends StatefulWidget {
  final AddressController _controller;
  final GlobalKey<FormState> formKey;
  final String? id;

  const _operatingInfo({
    Key? key,
    required this.id,
    required AddressController controller,
    required this.formKey,
  })  : _controller = controller,
        super(key: key);

  @override
  State<_operatingInfo> createState() => _operatingInfoState();
}

class _operatingInfoState extends State<_operatingInfo> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.id == null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Set Operating Hours",
                style: kThemeStyleBold.copyWith(fontSize: 18),
              ),
            ),
          TextFormField(
            controller: widget._controller.mondayFriday,
            focusNode: widget._controller.mondayFridayNode,
            decoration: const InputDecoration(label: Text("Monday to Friday")),
            validator: (v) =>
                widget._controller.checkNullValidator(v, "Monday to Friday"),
            onFieldSubmitted: (_) =>
                widget._controller.mondayFridayNode.requestFocus(),
          ),
          TextFormField(
            controller: widget._controller.saturday,
            focusNode: widget._controller.saturdayNode,
            decoration: const InputDecoration(label: Text("Saturday")),
            validator: (v) =>
                widget._controller.checkNullValidator(v, "Saturday"),
            onFieldSubmitted: (_) =>
                widget._controller.saturdayNode.requestFocus(),
          ),
          TextFormField(
            controller: widget._controller.sunday,
            focusNode: widget._controller.sundayNode,
            decoration: const InputDecoration(label: Text("Sunday")),
            validator: (v) =>
                widget._controller.checkNullValidator(v, "Sunday"),
            onFieldSubmitted: (_) =>
                widget._controller.sundayNode.requestFocus(),
          ),
          TextFormField(
            controller: widget._controller.public,
            focusNode: widget._controller.publicNode,
            decoration: const InputDecoration(label: Text("Public Holiday")),
            validator: (v) =>
                widget._controller.checkNullValidator(v, "Public Holiday"),
            onFieldSubmitted: (_) => widget._controller.publicNode.unfocus(),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 6),
            child: Text("Opening Type ?"),
          ),
          Wrap(
              children: widget._controller.opening.entries
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(
                          e.value,
                          style: widget._controller.openingSelected(e.key)
                              ? kWhiteStyle
                              : kThemeStyle,
                        ),
                        selected: widget._controller.openingSelected(e.key),
                        selectedColor: kThemeColor,
                        onSelected: (_) => setState(
                          () => widget._controller.setOpening(e.key),
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}

class _ListLocation extends StatefulWidget {
  final LocationController controller;
  const _ListLocation({Key? key, required this.controller}) : super(key: key);

  @override
  State<_ListLocation> createState() => __ListLocationState();
}

class __ListLocationState extends State<_ListLocation> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, WasteModel>>(
        future: WasteDao().wastes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Widget> children = snapshot.data!.entries
                .map(
                  (e) => _Tile(
                    waste: e.value,
                    id: e.key,
                    controller: widget.controller,
                    selected: widget.controller.checkManagingWaste(e.key),
                    onTap: (value) =>
                        setState(() => widget.controller.setWaste(value)),
                  ),
                )
                .toList();
            return ListView(
              padding: const EdgeInsets.only(bottom: 80, top: 16),
              children: children,
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
  final LocationController controller;
  final WasteModel waste;
  final String id;
  final bool selected;
  final Function(String?) onTap;

  const _Tile({
    Key? key,
    required this.waste,
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
            color: kBlack.withOpacity(0.1),
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
        title: Text(waste.name ?? "", style: const TextStyle(color: kBlack)),
      ),
    );
  }
}
