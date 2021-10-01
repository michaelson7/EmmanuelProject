import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/Model/core/GaugeStationModel.dart';
import 'package:flutter_project/Model/core/NewsModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/StaffModel.dart';
import 'package:flutter_project/Model/core/StationStatisticsModel.dart';
import 'package:flutter_project/Model/core/StationsModel.dart';
import 'package:flutter_project/Model/core/UsersModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/service/api.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';

class ApiHelper {
  Api api = new Api();

  //ROLES
  Future<RolesModel?> rolesGet({required int id}) async {
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
      }
    } catch (e) {
      throw Exception(getError(e, 'rolesGet'));
    }
  }

  Future<List<RolesModel>?> rolesGetAll() async {
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

  //GaugeRecords
  Future<List<GaugeRecordsModel>?> GaugeRecordsGet({required int id}) async {
    try {
      List<GaugeRecordsModel> model = [];
      var jsonResponse =
          await api.globalGetRequest(src: 'GaugeRecords', Id: id);
      if (!jsonResponse["error"]) {
        List<dynamic> results = jsonResponse["results"];
        for (int i = 0; i < results.length; i++) {
          var modelData =
              GaugeRecordsModel.fromJson(jsonResponse["results"][i]);
          model.add(modelData);
        }
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'GaugeRecordsGet'));
    }
  }

  Future<List<GaugeRecordsModel>?> GaugeRecordsGetAll() async {
    try {
      List<GaugeRecordsModel> model = [];
      var jsonResponse = await api.globalGetAllRequest(src: 'GaugeRecords');
      if (!jsonResponse["error"]) {
        List<dynamic> results = jsonResponse["results"];
        for (int i = 0; i < results.length; i++) {
          var modelData =
              GaugeRecordsModel.fromJson(jsonResponse["results"][i]);
          model.add(modelData);
        }
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'GaugeRecordsGet'));
    }
  }

  Future<ResponseModel> GaugeRecordsDelete(int id) async {
    try {
      var response = await api.globalDeleteRequest(src: 'GaugeRecords', Id: id);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'GaugeRecordsDelete'));
    }
  }

  Future<ResponseModel> GaugeRecordsHandler(
      {required GaugeRecordsModel modelData, bool shouldUpdate = false}) async {
    try {
      var response = await api.gaugeRecordsHandler(
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
      throw Exception(getError(e, 'GaugeRecordsHandler'));
    }
  }

  //GaugeStation
  Future<GaugeStationModel?> GaugeStationGet({required int id}) async {
    try {
      GaugeStationModel model;
      var jsonResponse =
          await api.globalGetRequest(src: 'GaugeStation', Id: id);
      if (!jsonResponse["error"]) {
        model = GaugeStationModel.fromJson(jsonResponse["results"]);
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toJson().toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'GaugeStationGet'));
    }
  }

  Future<List<GaugeStationModel>?> GaugeStationGetAll() async {
    try {
      List<GaugeStationModel> model = [];
      var jsonResponse = await api.globalGetAllRequest(src: 'GaugeStation');
      if (!jsonResponse["error"]) {
        List<dynamic> results = jsonResponse["results"];
        for (int i = 0; i < results.length; i++) {
          var modelData =
              GaugeStationModel.fromJson(jsonResponse["results"][i]);
          model.add(modelData);
        }
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'GaugeStationGet'));
    }
  }

  Future<ResponseModel> GaugeStationDelete(int id) async {
    try {
      var response = await api.globalDeleteRequest(src: 'GaugeStation', Id: id);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'GaugeStationDelete'));
    }
  }

  Future<ResponseModel> GaugeStationHandler(
      {required GaugeStationModel modelData, bool shouldUpdate = false}) async {
    try {
      var response = await api.gaugeStationHandler(
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
      throw Exception(getError(e, 'GaugeStationHandler'));
    }
  }

  //News
  Future<NewsModel?> NewsGet({required int id}) async {
    try {
      NewsModel model;
      var jsonResponse = await api.globalGetRequest(src: 'News', Id: id);
      if (!jsonResponse["error"]) {
        model = NewsModel.fromJson(jsonResponse["results"]);
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toJson().toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'NewsGet'));
    }
  }

  Future<List<NewsModel>?> NewsGetAll() async {
    try {
      List<NewsModel> model = [];
      var jsonResponse = await api.globalGetAllRequest(src: 'News');
      if (!jsonResponse["error"]) {
        List<dynamic> results = jsonResponse["results"];
        for (int i = 0; i < results.length; i++) {
          var modelData = NewsModel.fromJson(jsonResponse["results"][i]);
          model.add(modelData);
        }
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'NewsGet'));
    }
  }

  Future<ResponseModel> NewsDelete(int id) async {
    try {
      var response = await api.globalDeleteRequest(src: 'News', Id: id);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'NewsDelete'));
    }
  }

  Future<ResponseModel> NewsHandler(
      {required NewsModel modelData, bool shouldUpdate = false}) async {
    try {
      var response = await api.newsHandler(
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
      throw Exception(getError(e, 'NewsHandler'));
    }
  }

  //Staff
  Future<StaffModel?> StaffGet({required int id}) async {
    try {
      StaffModel model;
      var jsonResponse = await api.globalGetRequest(src: 'Staff', Id: id);
      if (!jsonResponse["error"]) {
        model = StaffModel.fromJson(jsonResponse["results"]);
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toJson().toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'StaffGet'));
    }
  }

  Future<List<StaffModel>?> StaffGetAll() async {
    try {
      List<StaffModel> model = [];
      var jsonResponse = await api.globalGetAllRequest(src: 'Staff');
      if (!jsonResponse["error"]) {
        List<dynamic> results = jsonResponse["results"];
        for (int i = 0; i < results.length; i++) {
          var modelData = StaffModel.fromJson(jsonResponse["results"][i]);
          model.add(modelData);
        }
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'StaffGet'));
    }
  }

  Future<ResponseModel> StaffDelete(int id) async {
    try {
      var response = await api.globalDeleteRequest(src: 'Staff', Id: id);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'StaffDelete'));
    }
  }

  Future<ResponseModel> StaffHandler(
      {required StaffModel modelData, bool shouldUpdate = false}) async {
    try {
      var response = await api.staffHandler(
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
      throw Exception(getError(e, 'StaffHandler'));
    }
  }

  //Stations
  Future<StationsModel?> StationsGet({required int id}) async {
    try {
      StationsModel model;
      var jsonResponse = await api.globalGetRequest(src: 'Stations', Id: id);
      if (!jsonResponse["error"]) {
        model = StationsModel.fromJson(jsonResponse["results"]);
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toJson().toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'StationsGet'));
    }
  }

  Future<List<StationsModel>?> StationsGetAll() async {
    try {
      List<StationsModel> model = [];
      var jsonResponse = await api.globalGetAllRequest(src: 'Stations');
      if (!jsonResponse["error"]) {
        List<dynamic> results = jsonResponse["results"];
        for (int i = 0; i < results.length; i++) {
          var modelData = StationsModel.fromJson(jsonResponse["results"][i]);
          model.add(modelData);
        }
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'StationsGet'));
    }
  }

  Future<ResponseModel> StationsDelete(int id) async {
    try {
      var response = await api.globalDeleteRequest(src: 'Stations', Id: id);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'StationsDelete'));
    }
  }

  Future<ResponseModel> StationsHandler(
      {required StationsModel modelData, bool shouldUpdate = false}) async {
    try {
      var response = await api.stationsHandler(
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
      throw Exception(getError(e, 'StationsHandler'));
    }
  }

  //StationStatistics
  Future<StationStatisticsModel?> StationStatisticsGet(
      {required int id}) async {
    try {
      StationStatisticsModel model;
      var jsonResponse =
          await api.globalGetRequest(src: 'StationStatistics', Id: id);
      if (!jsonResponse["error"]) {
        model = StationStatisticsModel.fromJson(jsonResponse["results"]);
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toJson().toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'StationStatisticsGet'));
    }
  }

  Future<List<StationStatisticsModel>?> StationStatisticsGetAll() async {
    try {
      List<StationStatisticsModel> model = [];
      var jsonResponse =
          await api.globalGetAllRequest(src: 'StationStatistics');
      if (!jsonResponse["error"]) {
        List<dynamic> results = jsonResponse["results"];
        for (int i = 0; i < results.length; i++) {
          var modelData =
              StationStatisticsModel.fromJson(jsonResponse["results"][i]);
          model.add(modelData);
        }
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'StationStatisticsGet'));
    }
  }

  Future<ResponseModel> StationStatisticsDelete(int id) async {
    try {
      var response =
          await api.globalDeleteRequest(src: 'StationStatistics', Id: id);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'StationStatisticsDelete'));
    }
  }

  Future<ResponseModel> StationStatisticsHandler(
      {required StationStatisticsModel modelData,
      bool shouldUpdate = false}) async {
    try {
      var response = await api.stationStatisticsHandler(
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
      throw Exception(getError(e, 'StationStatisticsHandler'));
    }
  }

  //Users
  Future<UsersModel?> UsersGet({required int id}) async {
    try {
      UsersModel model;
      var jsonResponse = await api.globalGetRequest(src: 'Users', Id: id);
      if (!jsonResponse["error"]) {
        model = UsersModel.fromJson(jsonResponse["results"]);
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toJson().toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'UsersGet'));
    }
  }

  Future<List<UsersModel>?> UsersGetAll() async {
    try {
      List<UsersModel> model = [];
      var jsonResponse = await api.globalGetAllRequest(src: 'Users');
      if (!jsonResponse["error"]) {
        List<dynamic> results = jsonResponse["results"];
        for (int i = 0; i < results.length; i++) {
          var modelData = UsersModel.fromJson(jsonResponse["results"][i]);
          model.add(modelData);
        }
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'UsersGet'));
    }
  }

  Future<ResponseModel> UsersDelete(int id) async {
    try {
      var response = await api.globalDeleteRequest(src: 'Users', Id: id);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'UsersDelete'));
    }
  }

  Future<ResponseModel> UsersHandler(
      {required UsersModel modelData, bool shouldUpdate = false}) async {
    try {
      var response = await api.usersHandler(
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
      throw Exception(getError(e, 'UsersHandler'));
    }
  }

  //---------------------------------------------------------------------------------------------------------------------------error handler
  String getError(errorMessage, src) {
    var message = 'Error while passing to $src: $errorMessage';
    loggerError(message: message);
    return message;
  }

  //---------------------------------------------------------------------------------------------------------------------------display json
  void displayJsonInLogger({
    bool shouldDisplayInLogger = false,
    dynamic jsonFile,
  }) {
    if (!shouldDisplayInLogger) {
      loggerInfo(message: "JSON RESPONSE: $jsonFile");
    }
  }
}
