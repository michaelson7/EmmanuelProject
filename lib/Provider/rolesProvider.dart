import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class RolesProvider extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  final _rolesController = BehaviorSubject<RolesModel>();
  RolesModel? rolesModel;

  Stream<RolesModel> get getStream {
    return _rolesController.stream;
  }

  Future<RolesModel?> getRoles(int id) async {
    var result = await _apiHelper.rolesGet(id: id);
    if (result != null) {
      _rolesController.add(result);
      return result;
    }
  }

  Future<List<RolesModel>?> getAllRoles() async {
    var result = await _apiHelper.rolesGetAll();
    if (result != null) {
      for (var data in result) {
        _rolesController.add(data);
      }
      return result;
    }
  }

  Future<ResponseModel> rolesHandler({
    required RolesModel modelData,
    bool shouldUpdate = false,
  }) async {
    var result = await _apiHelper.rolesHandler(
      modelData: modelData,
      shouldUpdate: shouldUpdate,
    );
    return result;
  }
}
