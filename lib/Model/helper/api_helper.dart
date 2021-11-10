import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/Model/core/GaugeStationModel.dart';
import 'package:flutter_project/Model/core/HostoricalDataModel.dart' as hdm;
import 'package:flutter_project/Model/core/NewsModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/StaffModel.dart';
import 'package:flutter_project/Model/core/StationStatisticsModel.dart';
import 'package:flutter_project/Model/core/StationStatsModel.dart';
import 'package:flutter_project/Model/core/StationsModel.dart';
import 'package:flutter_project/Model/core/UsersModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/service/api.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';
import 'package:image_picker/image_picker.dart';

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

  //gaugeRecords

  Future<List<GaugeRecordsModel>?> gaugeRecordsGet({required int id}) async {
    try {
      List<GaugeRecordsModel> model = [];
      var jsonResponse =
          await api.globalGetRequest(src: 'gaugeRecords', Id: id);
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
      throw Exception(getError(e, 'gaugeRecordsGet'));
    }
  }

  Future<List<GaugeRecordsModel>?> gaugeRecordsGetAll() async {
    try {
      List<GaugeRecordsModel> model = [];
      var jsonResponse = await api.globalGetAllRequest(src: 'gaugeRecords');
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
      throw Exception(getError(e, 'gaugeRecordsGet'));
    }
  }

  Future<ResponseModel> gaugeRecordsDelete(int id) async {
    try {
      var response = await api.globalDeleteRequest(src: 'gaugeRecords', Id: id);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'gaugeRecordsDelete'));
    }
  }

  Future<ResponseModel> gaugeRecordsHandler(
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
      throw Exception(getError(e, 'gaugeRecordsHandler'));
    }
  }

  Future<dynamic> gaugeRecordsUpload({
    required GaugeRecordsModel modelData,
    bool shouldUpdate = false,
    required XFile file,
  }) async {
    var response = await api.gaugeRecordsUpload(
      model: modelData,
      shouldUpdate: shouldUpdate,
      file: file,
    );
    ResponseModel model = ResponseModel.fromJson(response);
    displayJsonInLogger(
      shouldDisplayInLogger: true,
      jsonFile: model.toJson().toString(),
    );
    return model;
  }

  //gaugeStation
  Future<List<GaugeStationModel>?> stationGetGuages({required int id}) async {
    try {
      List<GaugeStationModel> model = [];
      var jsonResponse = await api.stationGetGuages(Id: id);
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
      throw Exception(getError(e, 'stationGetGuages'));
    }
  }

  Future<List<StationStatsModel>?> stationGetStats({
    required int stationId,
  }) async {
    try {
      List<StationStatsModel> model = [];
      var jsonResponse = await api.stationGetStats(stationId: stationId);
      if (!jsonResponse["error"]) {
        List<dynamic> results = jsonResponse["results"];
        for (int i = 0; i < results.length; i++) {
          var modelData = StationStatsModel.fromJson(
            jsonResponse["results"][i],
          );
          model.add(modelData);
        }
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'stationGetStats'));
    }
  }

  Future<GaugeStationModel?> gaugeStationGet({required int id}) async {
    try {
      GaugeStationModel model;
      var jsonResponse =
          await api.globalGetRequest(src: 'gaugeStation', Id: id);
      if (!jsonResponse["error"]) {
        model = GaugeStationModel.fromJson(jsonResponse["results"]);
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toJson().toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'gaugeStationGet'));
    }
  }

  Future<List<GaugeStationModel>?> gaugeStationGetAll() async {
    try {
      List<GaugeStationModel> model = [];
      var jsonResponse = await api.globalGetAllRequest(src: 'gaugeStation');
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
      throw Exception(getError(e, 'gaugeStationGet'));
    }
  }

  Future<ResponseModel> gaugeStationDelete(int id) async {
    try {
      var response = await api.globalDeleteRequest(src: 'gaugeStation', Id: id);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'gaugeStationDelete'));
    }
  }

  Future<ResponseModel> gaugeStationHandler(
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
      throw Exception(getError(e, 'gaugeStationHandler'));
    }
  }

  //news
  Future<NewsModel?> newsGet({required int id}) async {
    try {
      NewsModel model;
      var jsonResponse = await api.globalGetRequest(src: 'news', Id: id);
      if (!jsonResponse["error"]) {
        model = NewsModel.fromJson(jsonResponse["results"]);
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toJson().toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'newsGet'));
    }
  }

  Future<List<NewsModel>?> newsGetAll() async {
    try {
      List<NewsModel> model = [];
      var jsonResponse = await api.globalGetAllRequest(src: 'news');
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
      throw Exception(getError(e, 'newsGetAll'));
    }
  }

  Future<ResponseModel> newsDelete(int id) async {
    try {
      var response = await api.globalDeleteRequest(src: 'news', Id: id);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'newsDelete'));
    }
  }

  Future<ResponseModel> newsHandler(
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
      throw Exception(getError(e, 'newsHandler'));
    }
  }

  //staff
  Future<StaffModel?> staffGet({required int id}) async {
    try {
      StaffModel model;
      var jsonResponse = await api.globalGetRequest(src: 'staff', Id: id);
      if (!jsonResponse["error"]) {
        model = StaffModel.fromJson(jsonResponse["results"]);
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toJson().toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'staffGet'));
    }
  }

  Future<List<StaffModel>?> staffGetAll() async {
    try {
      List<StaffModel> model = [];
      var jsonResponse = await api.globalGetAllRequest(src: 'staff');
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
      throw Exception(getError(e, 'staffGet'));
    }
  }

  Future<ResponseModel> staffDelete(int id) async {
    try {
      var response = await api.globalDeleteRequest(src: 'staff', Id: id);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'staffDelete'));
    }
  }

  Future<ResponseModel> staffHandler(
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
      throw Exception(getError(e, 'staffHandler'));
    }
  }

  //stations
  Future<StationsModel?> stationsGet({required int id}) async {
    try {
      StationsModel model;
      var jsonResponse = await api.globalGetRequest(src: 'stations', Id: id);
      if (!jsonResponse["error"]) {
        model = StationsModel.fromJson(jsonResponse["results"]);
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toJson().toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'stationsGet'));
    }
  }

  Future<List<StationsModel>?> stationsGetAll() async {
    try {
      List<StationsModel> model = [];
      var jsonResponse = await api.globalGetAllRequest(src: 'stations');
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
      throw Exception(getError(e, 'stationsGetAll'));
    }
  }

  Future<List<hdm.HistoricalDataModel>?> stationsGetHistoricalData({
    required int stationId,
  }) async {
    try {
      List<hdm.HistoricalDataModel> model = [];
      var jsonResponse = await api.stationsGetHistoricalData(
        stationId: stationId,
      );
      if (!jsonResponse["error"]) {
        List<dynamic> results = jsonResponse["results"];
        for (int i = 0; i < results.length; i++) {
          var modelData = hdm.HistoricalDataModel.fromJson(
            jsonResponse["results"][i],
          );
          model.add(modelData);
        }
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'stationsGetHistoricalData'));
    }
  }

  Future<ResponseModel> stationsDelete(int id) async {
    try {
      var response = await api.globalDeleteRequest(src: 'stations', Id: id);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'stationsDelete'));
    }
  }

  Future<ResponseModel> stationsHandler(
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
      throw Exception(getError(e, 'stationsHandler'));
    }
  }

  //stationstatistics
  Future<StationStatisticsModel?> stationstatisticsGet(
      {required int id}) async {
    try {
      StationStatisticsModel model;
      var jsonResponse =
          await api.globalGetRequest(src: 'stationstatistics', Id: id);
      if (!jsonResponse["error"]) {
        model = StationStatisticsModel.fromJson(jsonResponse["results"]);
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toJson().toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'stationstatisticsGet'));
    }
  }

  Future<List<StationStatisticsModel>?> stationstatisticsGetAll() async {
    try {
      List<StationStatisticsModel> model = [];
      var jsonResponse =
          await api.globalGetAllRequest(src: 'stationstatistics');
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
      throw Exception(getError(e, 'stationstatisticsGet'));
    }
  }

  Future<ResponseModel> stationstatisticsDelete(int id) async {
    try {
      var response =
          await api.globalDeleteRequest(src: 'stationstatistics', Id: id);
      ResponseModel model = ResponseModel.fromJson(response);
      displayJsonInLogger(
        shouldDisplayInLogger: false,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'stationstatisticsDelete'));
    }
  }

  Future<ResponseModel> stationStatisticsHandler(
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
      throw Exception(getError(e, 'stationstatisticsHandler'));
    }
  }

  //Users
  Future<UsersModel?> usersGet({required int id}) async {
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

  Future<List<UsersModel>?> usersGetAll() async {
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

  Future<ResponseModel> usersDelete(int id) async {
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

  Future<ResponseModel> usersHandler(
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

  Future<UsersModel?> usersLogin({
    required String email,
    required String password,
  }) async {
    try {
      UsersModel model;
      var jsonResponse = await api.usersLogin(
        email: email,
        password: password,
      );
      if (!jsonResponse["error"]) {
        model = UsersModel.fromJson(jsonResponse["results"]);
        displayJsonInLogger(
          shouldDisplayInLogger: false,
          jsonFile: model.toJson().toString(),
        );
        return model;
      }
    } catch (e) {
      throw Exception(getError(e, 'usersLogin'));
    }
  }

  Future<ResponseModel?> usersRegistration({
    required UsersModel usersModel,
    bool showResponse = false,
  }) async {
    try {
      var jsonResponse = await api.usersRegistration(
        model: usersModel,
        showResponse: showResponse,
      );
      ResponseModel model = ResponseModel.fromJson(jsonResponse);
      displayJsonInLogger(
        shouldDisplayInLogger: showResponse,
        jsonFile: model.toJson().toString(),
      );
      return model;
    } catch (e) {
      throw Exception(getError(e, 'usersRegistration'));
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
    if (shouldDisplayInLogger) {
      loggerInfo(message: "JSON RESPONSE: $jsonFile");
    }
  }
}
