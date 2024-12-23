// ignore: file_names

import 'package:admin_kitaro/database/recycle_dao.dart';
import 'package:admin_kitaro/model/location/location_model.dart';
import 'package:admin_kitaro/model/recycle/recycle_model.dart';
import 'package:admin_kitaro/view/detail/submission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:excel/excel.dart';

part 'detail.freezed.dart';

@freezed
abstract class DetailState with _$DetailState {
  const factory DetailState.initial(List<RecycleModel> values) = _Initial;
  const factory DetailState.load(List<RecycleModel> values) = _Load;
  const factory DetailState.loading() = _Loading;
}

class DetailModel {
  final LocationModel model;
  final String locationId;
  late List<RecycleModel> wastes;

  DetailModel(
      {required this.model, required this.locationId, required this.wastes});
}

abstract class DetailController extends StateNotifier<DetailState>
    with LocatorMixin {
  DetailController() : super(const DetailState.loading());

  List<RecycleModel> recycles = [];
  List<RecycleModel> filtered = [];

  // void reload(List<RecycleModel> list) {

  //   state = const DetailState.initial(DetailModel());
  // }

  void initial(String id, LocationModel location) async {
    // ignore: prefer_const_constructors
    state = DetailState.initial([]);
    RecycleDao().getRecycles(key: 'location', value: id).then(
      (data) {
        final values = data.values.toList();
        values.sort((a, b) {
          if (int.tryParse(b.datetime.toString()) != null) {
            return int.parse(b.datetime.toString())
                .compareTo(int.parse(a.datetime.toString()));
          } else {
            return 0;
          }
        });

        recycles = values;
        state = DetailState.load(values);
      },
    );
  }
}

class DetailProvider {
  static Provider<DetailControllerImp> createProvider() =>
      Provider<DetailControllerImp>(
        create: (_) => DetailControllerImp(null, null),
      );

  static StateNotifierProvider<DetailControllerImp, DetailState> create(
      LocationModel? model, String? id) {
    return StateNotifierProvider<DetailControllerImp, DetailState>(
      create: (_) => DetailControllerImp(id, model),
      child: DetailScreen(model: model, id: id),
    );
  }
}

class DetailControllerImp extends DetailController {
  // late LocationModel? _location;

  DetailControllerImp(String? id, LocationModel? model) : super() {
    if (id != null && model != null) {
      initial(id, model);
    }
    // _location = read<DetailState>().whenOrNull(initial: (value) {
    //   if (value != null) return value;
    //   throw "no location";
    // });
  }

  void export(BuildContext context) {
    if (results.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No Result to export"),
      ));

      return;
    }
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['$daily.$monthly.$yearly'];

    CellStyle cellStyle = CellStyle(
        backgroundColorHex: "#BFBADB",
        fontFamily: getFontFamily(FontFamily.Calibri));

    //header
    var cell1 = sheetObject.cell(CellIndex.indexByString("A1"));
    cell1.value = "Country";
    cell1.cellStyle = cellStyle;
    var cell2 = sheetObject.cell(CellIndex.indexByString("B1"));
    cell2.value = "Latitude";
    cell2.cellStyle = cellStyle;
    var cell3 = sheetObject.cell(CellIndex.indexByString("C1"));
    cell3.value = "Longitude";
    cell3.cellStyle = cellStyle;
    var cell4 = sheetObject.cell(CellIndex.indexByString("D1"));
    cell4.value = "Usage";
    cell4.cellStyle = cellStyle;

    for (var i = 0; i < results.length; i++) {
      final cellIndex = i + 2;
      final cellA = sheetObject.cell(CellIndex.indexByString("A$cellIndex"));
      cellA.value = "MY";
      final cellB = sheetObject.cell(CellIndex.indexByString("B$cellIndex"));
      cellB.value = results[i].latStop;
      final cellC = sheetObject.cell(CellIndex.indexByString("C$cellIndex"));
      cellC.value = results[i].longStop;
      final cellD = sheetObject.cell(CellIndex.indexByString("D$cellIndex"));
      cellD.value = results[i].totalAmount;
    }

    final String fileName = "${DateTime.now()}";

    excel.delete('Sheet1');

    excel.save(fileName: "$fileName.xlsx");
  }

  void filter(BuildContext context) async {
    final current = DateTime.now();
    final selectedRange = await showDateRangePicker(
      context: context,
      currentDate: current,
      firstDate: DateTime(current.year, current.month - 12),
      lastDate: DateTime.now(),
    );

    if (selectedRange == null) return;

    final filtered = recycles.map((e) {
      final formatted = e.datetime.toString().dateTimeFormat();
      final end = selectedRange.end
          .add(const Duration(hours: 23, minutes: 59, seconds: 59));
      if (formatted.isBefore(end) && formatted.isAfter(selectedRange.start)) {
        return e;
      }

      return null;
    }).toList();

    final List<RecycleModel> solidify = [];
    for (var e in filtered) {
      if (e != null) {
        solidify.add(e);
      }
    }

    // if (solidify.isEmpty) return;
    super.filtered = solidify;

    state = DetailState.load(solidify);
  }
}

extension DateFormatting on String {
  String format() {
    return DateFormat('dd MMM yyyy  hh:mm a')
        .format(DateTime.fromMillisecondsSinceEpoch(int.parse(this)));
  }

  DateTime dateTimeFormat() {
    return DateTime.fromMillisecondsSinceEpoch(int.parse(this));
  }
}
