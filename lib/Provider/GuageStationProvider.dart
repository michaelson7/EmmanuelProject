import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/GaugeStationModel.dart';
import 'package:flutter_project/Model/core/GaugeStationModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class GaugeStationProvider extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  final _GaugeStationController = BehaviorSubject<GaugeStationModel>();
  GaugeStationModel? gaugeStationModel;

  Stream<GaugeStationModel> get getStream {
    return _GaugeStationController.stream;
  }

  Future<GaugeStationModel?> getGaugeStation(int id) async {
    var result = await _apiHelper.GaugeStationGet(id: id);
    if (result != null) {
      _GaugeStationController.add(result);
      return result;
    }
  }

  Future<List<GaugeStationModel>?> getAllGaugeStation() async {
    var result = await _apiHelper.GaugeStationGetAll();
    if (result != null) {
      for (var data in result) {
        _GaugeStationController.add(data);
      }
      return result;
    }
  }

  Future<ResponseModel> GaugeStationHandler({
    required GaugeStationModel modelData,
    bool shouldUpdate = false,
  }) async {
    var result = await _apiHelper.GaugeStationHandler(
      modelData: modelData,
      shouldUpdate: shouldUpdate,
    );
    return result;
  }
}
