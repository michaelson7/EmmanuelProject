import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';
import 'package:flutter_project/Provider/ImageProvider.dart';
import 'package:rxdart/rxdart.dart';

class GaugeRecordsProvider extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  final _GaugeRecordsController = BehaviorSubject<GaugeRecordsModel>();
  final _GaugeRecordsListController =
      BehaviorSubject<List<GaugeRecordsModel>>();

  get GaugeRecordsController => _GaugeRecordsController.stream;
  get GaugeRecordsListController => _GaugeRecordsListController.stream;

  Future<List<GaugeRecordsModel>?> getGaugeRecords(int id) async {
    var result = await _apiHelper.gaugeRecordsGet(id: id);
    if (result != null) {
      for (var data in result) {
        _GaugeRecordsController.add(data);
      }
      return result;
    }
  }

  Future<List<GaugeRecordsModel>?> getAllGaugeRecords() async {
    //var result = await _apiHelper.gaugeRecordsGetAll();.
    List<GaugeRecordsModel> result = [];
    for (var i = 0; i < 10; i++) {
      var data = GaugeRecordsModel(
        id: i,
        uploaderId: i,
        gpsLocation: '0000-0000-0000-0000',
        waterlevel: 12,
        temperature: 32,
        riverFlow: 43.2,
        gaugeId: i,
        approval: false,
        approverId: 0,
        timestamp: null,
        uploaderModel: null,
        approverModel: null,
        gaugeStationModel: null,
        imagepath: getImage(),
      );
      result.add(data);
    }
    if (result != null) {
      _GaugeRecordsListController.add(result);
      return result;
    }
  }

  Future<ResponseModel> GaugeRecordsHandler({
    required GaugeRecordsModel modelData,
    bool shouldUpdate = false,
  }) async {
    var result = await _apiHelper.gaugeRecordsHandler(
      modelData: modelData,
      shouldUpdate: shouldUpdate,
    );
    return result;
  }
}
