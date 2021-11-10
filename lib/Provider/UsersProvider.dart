import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/UsersModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class UsersProvider extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  final _UsersController = BehaviorSubject<UsersModel>();

  Stream<UsersModel> get getStream {
    return _UsersController.stream;
  }

  Future<UsersModel?> getUsers(int id) async {
    var result = await _apiHelper.usersGet(id: id);
    if (result != null) {
      _UsersController.add(result);
      return result;
    }
  }

  Future<List<UsersModel>?> getAllUsers() async {
    var result = await _apiHelper.usersGetAll();
    if (result != null) {
      for (var data in result) {
        _UsersController.add(data);
      }
      return result;
    }
  }

  Future<ResponseModel> UsersHandler({
    required UsersModel modelData,
    bool shouldUpdate = false,
  }) async {
    var result = await _apiHelper.usersHandler(
      modelData: modelData,
      shouldUpdate: shouldUpdate,
    );
    return result;
  }

  Future<UsersModel?> usersLogin({
    required String email,
    required String password,
  }) async {
    var result = await _apiHelper.usersLogin(
      email: email,
      password: password,
    );
    return result;
  }

  Future<ResponseModel?> usersRegistration(
      {required UsersModel usersModel, bool showResponse = false}) async {
    var result = await _apiHelper.usersRegistration(
      usersModel: usersModel,
      showResponse: showResponse,
    );
    return result;
  }
}
