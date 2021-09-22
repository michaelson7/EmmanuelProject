import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/core/user_data_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';

class AccountProvider extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  late UserDataModel _userDataModel;
  UserDataModel get userDataModel => _userDataModel;

  Future<ResponseModel> registerUser({required UserDataModel modelData}) async {
    ResponseModel response = await _apiHelper.samplePost(modelData: modelData);
    if (!response.error) {
      _userDataModel = modelData;
      notifyListeners();
    }
    return response;
  }

  Future<UserDataModel> loginUser({@required email, @required password}) async {
    UserDataModel response = await _apiHelper.sampleGet(
      email: email,
      password: password,
    );
    if (!response.error) {
      _userDataModel = response;
      notifyListeners();
    }
    return response;
  }
}
