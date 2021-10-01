import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/StationStatisticsModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class StationStatisticsProvider extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  final _StationStatisticsController =
      BehaviorSubject<StationStatisticsModel>();

  Stream<StationStatisticsModel> get getStream {
    return _StationStatisticsController.stream;
  }

  Future<StationStatisticsModel?> getStationStatistics(int id) async {
    StationStatisticsModel? result = await _apiHelper.stationstatisticsGet(
      id: id,
    );
    if (result != null) {
      _StationStatisticsController.add(result);
    }
  }

  Future<List<StationStatisticsModel>?> getAllStationStatistics() async {
    var result = await _apiHelper.stationstatisticsGetAll();
    if (result != null) {
      for (var data in result) {
        _StationStatisticsController.add(data);
      }
      return result;
    }
  }

  Future<ResponseModel> StationStatisticsHandler({
    required StationStatisticsModel modelData,
    bool shouldUpdate = false,
  }) async {
    var result = await _apiHelper.stationStatisticsHandler(
      modelData: modelData,
      shouldUpdate: shouldUpdate,
    );
    return result;
  }
}
