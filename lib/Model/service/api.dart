import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/Model/core/GaugeStationModel.dart';
import 'package:flutter_project/Model/core/NewsModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/StaffModel.dart';
import 'package:flutter_project/Model/core/StationStatisticsModel.dart';
import 'package:flutter_project/Model/core/StationsModel.dart';
import 'package:flutter_project/Model/core/UsersModel.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'data_access.dart';

class Api {
  String baseUrl = "10.0.2.2:8090";
  // String baseUrl = "192.168.5.127:8090";
  String urlPath = "";

  //ROLES
  Future<dynamic> rolesHandler(
      {required RolesModel model, bool shouldUpdate = false}) async {
    urlPath = shouldUpdate ? '/updateRoles' : '/createRoles';
    var modelData = model;
    final body = {
      "id": modelData.id.toString(),
      "title": modelData.title,
    };
    Uri uri = Uri.http(baseUrl, urlPath);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await postResponse(uri, body);
  }

  // gaugeStation
  Future<dynamic> gaugeStationHandler({
    required GaugeStationModel model,
    bool shouldUpdate = false,
  }) async {
    urlPath = shouldUpdate ? '/updateGaugeStation' : '/createGaugeStation';
    var modelData = model;
    final body = {
      "id": modelData.id.toString(),
      "title": modelData.title,
      "stationId": modelData.stationId.toString(),
    };
    Uri uri = Uri.http(baseUrl, urlPath);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await postResponse(uri, body);
  }

  // GaugeRecords
  Future<dynamic> gaugeRecordsHandler({
    required GaugeRecordsModel model,
    bool shouldUpdate = false,
  }) async {
    urlPath = shouldUpdate ? '/updateGaugeRecords' : '/createGaugeRecords';
    var modelData = model;
    final body = {
      "id": modelData.id.toString(),
      "uploaderId": model.uploaderId.toString(),
      "imagepath": modelData.imagepath,
      "gpsLocation": modelData.gpsLocation,
      "waterlevel": model.waterlevel.toString(),
      "temperature": model.temperature.toString(),
      "riverFlow": model.riverFlow.toString(),
      "gaugeId": model.gaugeId.toString(),
    };
    Uri uri = Uri.http(baseUrl, urlPath);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await postResponse(uri, body);
  }

  Future<dynamic> gaugeRecordsUpload({
    required GaugeRecordsModel model,
    bool shouldUpdate = false,
    required XFile file,
  }) async {
    urlPath = shouldUpdate ? '/updateGaugeRecords' : '/createGaugeRecords';
    var modelData = model;
    String fileName = file.path.split('/').last;
    final body = FormData.fromMap({
      "id": modelData.id,
      "uploaderId": modelData.uploaderId,
      "imagepath": modelData.imagepath,
      "gpsLocation": modelData.gpsLocation,
      "waterlevel": modelData.waterlevel,
      "temperature": modelData.temperature,
      "riverFlow": modelData.riverFlow,
      "gaugeId": modelData.gaugeId,
      "approval": modelData.approval,
      "approverId": modelData.approverId,
      "ImageFile": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });
    Uri uri = Uri.http(baseUrl, urlPath);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await postFileResponse(uri, body);
  }

  // News
  Future<dynamic> newsHandler({
    required NewsModel model,
    bool shouldUpdate = false,
  }) async {
    urlPath = shouldUpdate ? '/updateNews' : '/createNews';
    var modelData = model;
    final body = {
      "id": modelData.id.toString(),
      "heading": modelData.heading,
      "imagePath": modelData.imagePath,
      "message": modelData.message,
      "userId": modelData.userId.toString(),
      "imageFile": modelData.imageFile.toString(),
    };
    Uri uri = Uri.http(baseUrl, urlPath);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await postResponse(uri, body);
  }

  // staff
  Future<dynamic> staffHandler({
    required StaffModel model,
    bool shouldUpdate = false,
  }) async {
    urlPath = shouldUpdate ? '/updateStaff' : '/createStaff';
    var modelData = model;
    final body = {
      "id": modelData.id.toString(),
      "salary": modelData.salary.toString(),
      "userId": modelData.userId.toString(),
      "stationId": modelData.stationId.toString(),
    };
    Uri uri = Uri.http(baseUrl, urlPath);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await postResponse(uri, body);
  }

  // Stations
  Future<dynamic> stationsHandler({
    required StationsModel model,
    bool shouldUpdate = false,
  }) async {
    urlPath = shouldUpdate ? '/updateStations' : '/createStations';
    var modelData = model;
    final body = {
      "id": modelData.id.toString(),
      "title": modelData.title,
      "imagePath": modelData.imagePath,
      "imageFile": modelData.imageFile,
    };
    Uri uri = Uri.http(baseUrl, urlPath);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await postResponse(uri, body);
  }

  //stationsUpload
  Future<dynamic> uploadImage(String filePath) async {
    urlPath = "/createStations";
    http.MultipartRequest request = new http.MultipartRequest(
        "Post",
        Uri.parse(
          "http://10.0.2.2:8090/createStations",
        ));
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'file',
      filePath,
    );
    request.files.add(multipartFile);
    var headers = {"content-type": "multipart/form-file"};
    request.headers.addAll(headers);

    loggerAccent(message: request.toString());
    var response = await request.send();
    loggerAccent(message: response.statusCode.toString());
    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      return responseString;
    } else
      return null;
  }

  Future<dynamic> stationsGetHistoricalData({required int stationId}) async {
    urlPath = '/getHistoricalDataStations';
    final requestParameters = {"stationId": stationId.toString()};
    Uri uri = Uri.http(baseUrl, urlPath, requestParameters);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await getResponse(uri);
  }

  Future<dynamic> stationGetGuages({
    required int Id,
  }) async {
    urlPath = '/StationsGetGauge';
    final requestParameters = {"id": Id.toString()};
    final body = {};
    Uri uri = Uri.http(baseUrl, urlPath, requestParameters);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await postResponse(uri, body);
  }

  Future<dynamic> gaugeStationGetByStationId({
    required int Id,
  }) async {
    urlPath = '/GaugeStationGetByStationId';
    final requestParameters = {"id": Id.toString()};
    Uri uri = Uri.http(baseUrl, urlPath, requestParameters);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await getResponse(uri);
  }

  // StationStatistics
  Future<dynamic> stationStatisticsHandler({
    required StationStatisticsModel model,
    bool shouldUpdate = false,
  }) async {
    urlPath =
        shouldUpdate ? '/updateStationStatistics' : '/createStationStatistics';
    var modelData = model;
    final body = {
      "id": modelData.id.toString(),
      "stationId": modelData.stationId.toString(),
      "coordinates": modelData.coordinates,
      "location": modelData.location
    };
    Uri uri = Uri.http(baseUrl, urlPath);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await postResponse(uri, body);
  }

  // Users
  Future<dynamic> usersHandler({
    required UsersModel model,
    bool shouldUpdate = false,
  }) async {
    urlPath = shouldUpdate ? '/updateUsers' : '/createUsers';
    var modelData = model;
    final body = {
      "id": modelData.id.toString(),
      "firstName": modelData.firstName,
      "lastName": modelData.lastName,
      "email": modelData.email,
      "password": modelData.password,
      "roleId": modelData.roleId.toString(),
    };
    Uri uri = Uri.http(baseUrl, urlPath);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await postResponse(uri, body);
  }

//login
  Future<dynamic> usersLogin({
    required String email,
    required String password,
  }) async {
    urlPath = '/loginUser';
    final requestParameters = {
      "email": email,
      "password": password,
    };
    Uri uri = Uri.http(baseUrl, urlPath, requestParameters);
    displayUriInLogger(
      shouldDisplayInLogger: true,
      Uri: uri.toString(),
    );
    return await getResponse(uri);
  }

  //reg
  Future<dynamic> usersRegistration({
    required UsersModel model,
    bool showResponse = false,
  }) async {
    urlPath = '/createUsers';
    var modelData = model;
    final body = {
      "id": modelData.id.toString(),
      "firstName": modelData.firstName,
      "lastName": modelData.lastName,
      "email": modelData.email,
      "password": modelData.password,
      "roleId": modelData.roleId.toString(),
    };
    Uri uri = Uri.http(baseUrl, urlPath);
    displayUriInLogger(
      shouldDisplayInLogger: showResponse,
      Uri: uri.toString(),
    );
    return await postResponse(uri, body);
  }

  //stats
  Future<dynamic> stationGetStats({
    required int stationId,
  }) async {
    urlPath = '/getHistoricalDataStations';
    final requestParameters = {
      "stationId": stationId.toString(),
    };
    Uri uri = Uri.http(
      baseUrl,
      urlPath,
      requestParameters,
    );
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await getResponse(uri);
  }

  //------------------------------------------------------------------------------global requests
  Future<dynamic> globalGetRequest({
    required String src,
    required int Id,
  }) async {
    urlPath = '/Get$src';
    final requestParameters = {"id": Id.toString()};
    Uri uri = Uri.http(baseUrl, urlPath, requestParameters);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await getResponse(uri);
  }

  Future<dynamic> globalGetAllRequest({required String src}) async {
    urlPath = '/GetAll$src';
    Uri uri = Uri.http(baseUrl, urlPath);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await getResponse(uri);
  }

  Future<dynamic> globalDeleteRequest({
    required String src,
    required int Id,
  }) async {
    urlPath = '/Delete$src';
    final requestParameters = {"Id": Id.toString()};
    Uri uri = Uri.http(baseUrl, urlPath, requestParameters);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await getResponse(uri);
  }

  void displayUriInLogger({bool shouldDisplayInLogger = false, dynamic Uri}) {
    if (shouldDisplayInLogger) {
      loggerInfo(message: "URI: $Uri");
    }
  }
}
