import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/StationsModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class StationsProvider extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  final _stationsController = BehaviorSubject<StationsModel>();
  final _stationsListController = BehaviorSubject<List<StationsModel>>();

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
    // var result = await _apiHelper.stationsGetAll();
    List<StationsModel> result = [
      StationsModel(
        id: 5,
        title: 'title',
        imagePath:
            'https://images.unsplash.com/photo-1633113090286-3318ea2d24ae?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmV'
            'lZHwxfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        stationStatisticsModel: null,
      ),
      StationsModel(
        id: 5,
        title: 'title',
        imagePath:
            'https://images.unsplash.com/photo-1633113090286-3318ea2d24ae?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmV'
            'lZHwxfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        stationStatisticsModel: null,
      ),
      StationsModel(
        id: 5,
        title: 'title',
        imagePath:
            'https://images.unsplash.com/photo-1633113090286-3318ea2d24ae?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmV'
            'lZHwxfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        stationStatisticsModel: null,
      ),
    ];

    if (result != null) {
      _stationsListController.add(result);
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
