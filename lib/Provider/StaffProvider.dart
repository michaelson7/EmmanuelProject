import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/StaffModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class StaffProvider extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  final _StaffController = BehaviorSubject<StaffModel>();

  Stream<StaffModel> get getStream {
    return _StaffController.stream;
  }

  Future<StaffModel?> getStaff(int id) async {
    var result = await _apiHelper.StaffGet(id: id);
    if (result != null) {
      _StaffController.add(result);
      return result;
    }
  }

  Future<List<StaffModel>?> getAllStaff() async {
    var result = await _apiHelper.StaffGetAll();
    if (result != null) {
      for (var data in result) {
        _StaffController.add(data);
      }
      return result;
    }
  }

  Future<ResponseModel> StaffHandler({
    required StaffModel modelData,
    bool shouldUpdate = false,
  }) async {
    var result = await _apiHelper.StaffHandler(
      modelData: modelData,
      shouldUpdate: shouldUpdate,
    );
    return result;
  }
}
