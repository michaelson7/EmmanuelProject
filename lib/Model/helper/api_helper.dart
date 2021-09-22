import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/core/user_data_model.dart';
import 'package:flutter_project/Model/service/api.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';

class ApiHelper {
  Api api = new Api();

  Future<dynamic> globalGetRequest({
    required String src,
    required int Id,
  }) async {
    try {
      var response = await api.globalGetRequest(src: src, Id: Id);
      UserDataModel model = UserDataModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'sampleGet'));
    }
  }

  //sample get
  Future<UserDataModel> sampleGet({email, password}) async {
    try {
      var response = await api.sampleGet(email: email, password: password);
      UserDataModel model = UserDataModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'sampleGet'));
    }
  }

  //sample post
  Future<ResponseModel> samplePost({required UserDataModel modelData}) async {
    try {
      var response = await api.samplePost(model: modelData);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'samplePost'));
    }
  }

  //error handler
  String getError(errorMessage, src) {
    var message = 'Error while passing to $src: $errorMessage';
    loggerError(message: message);
    return message;
  }

  //display json
  void displayJsonInLogger({
    bool shouldDisplayInLogger = false,
    dynamic jsonFile,
  }) {
    if (shouldDisplayInLogger) {
      loggerInfo(message: "JSON RESPONSE: $jsonFile");
    }
  }
}
