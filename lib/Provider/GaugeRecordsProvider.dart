import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class GaugeRecordsProvider extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  final _GaugeRecordsController = BehaviorSubject<GaugeRecordsModel>();
  GaugeRecordsModel? gaugeRecordsModel;

  Stream<GaugeRecordsModel> get getStream {
    return _GaugeRecordsController.stream;
  }

  Future<List<GaugeRecordsModel>?> getGaugeRecords(int id) async {
    var result = await _apiHelper.GaugeRecordsGet(id: id);
    if (result != null) {
      for (var data in result) {
        _GaugeRecordsController.add(data);
      }
      return result;
    }
  }

  Future<List<GaugeRecordsModel>?> getAllGaugeRecords() async {
    var result = await _apiHelper.GaugeRecordsGetAll();
    if (result != null) {
      for (var data in result) {
        _GaugeRecordsController.add(data);
      }
      return result;
    }
  }

  Future<ResponseModel> GaugeRecordsHandler({
    required GaugeRecordsModel modelData,
    bool shouldUpdate = false,
  }) async {
    var result = await _apiHelper.GaugeRecordsHandler(
      modelData: modelData,
      shouldUpdate: shouldUpdate,
    );
    return result;
  }
}
