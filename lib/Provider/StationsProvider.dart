import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/HostoricalDataModel.dart';
import 'package:flutter_project/Model/core/StationsModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';
import 'package:rxdart/rxdart.dart';

import 'ImageProvider.dart';

class StationsProvider extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  final _stationsController = BehaviorSubject<StationsModel>();
  final _stationsListController = BehaviorSubject<List<StationsModel>>();
  final _historyListController = BehaviorSubject<List<HistoricalDataModel>>();

  get stationsController => _stationsController.stream;
  get stationsListController => _stationsListController.stream;

  Future<StationsModel?> getStations(int id) async {
    var result = await _apiHelper.stationsGet(id: id);
    if (result != null) {
      _stationsController.add(result);
      return result;
    }
  }

  Future<List<StationsModel>?> getAllStations() async {
    var result = await _apiHelper.stationsGetAll();
    if (result != null) {
      _stationsListController.add(result);
      return result;
    }
  }

  Future<List<HistoricalDataModel>?> stationsGetHistoricalData({
    required int stationId,
  }) async {
    var result = await _apiHelper.stationsGetHistoricalData(
      stationId: stationId,
    );
    if (result != null) {
      _historyListController.add(result);
      return result;
    }
  }

  Future<ResponseModel> StationsHandler({
    required StationsModel modelData,
    bool shouldUpdate = false,
  }) async {
    var result = await _apiHelper.stationsHandler(
      modelData: modelData,
      shouldUpdate: shouldUpdate,
    );
    return result;
  }
}
