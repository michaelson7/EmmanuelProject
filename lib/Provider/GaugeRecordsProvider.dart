import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';
import 'package:flutter_project/Provider/ImageProvider.dart';
import 'package:image_picker/image_picker.dart';
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
      _GaugeRecordsListController.add(result);
      return result;
    }
  }

  Future<List<GaugeRecordsModel>?> getAllGaugeRecords() async {
    var result = await _apiHelper.gaugeRecordsGetAll();
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

  Future<ResponseModel> gaugeRecordsUpload({
    required GaugeRecordsModel modelData,
    bool shouldUpdate = false,
    required XFile file,
  }) async {
    var result = await _apiHelper.gaugeRecordsUpload(
      modelData: modelData,
      shouldUpdate: shouldUpdate,
      file: file,
    );
    return result;
  }
}
