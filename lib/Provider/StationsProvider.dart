import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/StationsModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class StationsProvider extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  final _StationsController = BehaviorSubject<StationsModel>();

  Stream<StationsModel> get getStream {
    return _StationsController.stream;
  }

  Future<StationsModel?> getStations(int id) async {
    var result = await _apiHelper.stationsGet(id: id);
    if (result != null) {
      _StationsController.add(result);
      return result;
    }
  }

  Future<List<StationsModel>?> getAllStations() async {
    var result = await _apiHelper.stationsGetAll();
    if (result != null) {
      for (var data in result) {
        _StationsController.add(data);
      }
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
