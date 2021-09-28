import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/core/user_data_model.dart';
import 'package:flutter_project/Model/service/api.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';

class ApiHelper {
  Api api = new Api();

  //ROLES
  Future<RolesModel> rolesGet({required int id}) async {
    try {
      RolesModel model;
      var jsonResponse = await api.globalGetRequest(src: 'Roles', Id: id);
      if (!jsonResponse["error"]) {
        model = RolesModel.fromJson(jsonResponse["results"]);
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toJson().toString(),
        );
        return model;
      } else {
        throw Exception(getError('empty', 'rolesGet'));
      }
    } catch (e) {
      throw Exception(getError(e, 'rolesGet'));
    }
  }

  Future<List<RolesModel>> rolesGetAll() async {
    try {
      List<RolesModel> model = [];
      var jsonResponse = await api.globalGetAllRequest(src: 'Roles');
      if (!jsonResponse["error"]) {
        List<dynamic> results = jsonResponse["results"];
        for (int i = 0; i < results.length; i++) {
          var modelData = RolesModel.fromJson(jsonResponse["results"][i]);
          model.add(modelData);
        }
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toString(),
        );
        return model;
      }
      throw Exception(getError('empty', 'rolesGetAll'));
    } catch (e) {
      throw Exception(getError(e, 'rolesGet'));
    }
  }

  Future<ResponseModel> rolesDelete(int id) async {
    try {
      var response = await api.globalDeleteRequest(src: 'Roles', Id: id);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'rolesDelete'));
    }
  }

  Future<ResponseModel> rolesHandler(
      {required RolesModel modelData, bool shouldUpdate = false}) async {
    try {
      var response = await api.rolesHandler(
        model: modelData,
        shouldUpdate: shouldUpdate,
      );
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'rolesHandler'));
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
    if (!shouldDisplayInLogger) {
      loggerInfo(message: "JSON RESPONSE: $jsonFile");
    }
  }
}
