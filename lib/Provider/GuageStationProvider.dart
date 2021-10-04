import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/GaugeStationModel.dart';
import 'package:flutter_project/Model/core/GaugeStationModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class GaugeStationProvider extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  final _gaugeStationController = BehaviorSubject<GaugeStationModel>();
  final _gaugeStationListController =
      BehaviorSubject<List<GaugeStationModel>>();

  get gaugeStationController => _gaugeStationController.stream;
  get gaugeStationListController => _gaugeStationListController.stream;

  Future<GaugeStationModel?> getGaugeStation(int id) async {
    var result = await _apiHelper.gaugeStationGet(id: id);
    if (result != null) {
      _gaugeStationController.add(result);
      return result;
    }
  }

  Future<List<GaugeStationModel>?> getAllGaugeStation() async {
    //var result = await _apiHelper.gaugeStationGetAll();
    List<GaugeStationModel> result = [];
    for (var i = 0; i < 10; i++) {
      var value = GaugeStationModel(
        id: i,
        title: 'Sample Title $i',
        stationId: i + 5,
        stationsModel: null,
      );
      result.add(value);
    }

    if (result != null) {
      _gaugeStationListController.add(result);
      return result;
    }
  }

  Future<ResponseModel> GaugeStationHandler({
    required GaugeStationModel modelData,
    bool shouldUpdate = false,
  }) async {
    var result = await _apiHelper.gaugeStationHandler(
      modelData: modelData,
      shouldUpdate: shouldUpdate,
    );
    return result;
  }
}
