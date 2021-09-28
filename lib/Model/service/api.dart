import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/user_data_model.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';

import 'data_access.dart';

class Api {
  String baseUrl = "127.0.0.1:8090";
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

  //sample got request
  Future<dynamic> sampleGet({required email, required password}) async {
    urlPath = '/login';
    final requestParameters = {
      "Email": email,
      "Password": password,
    };
    Uri uri = Uri.http(baseUrl, urlPath, requestParameters);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await getResponse(uri);
  }

//sample post request
  Future<dynamic> samplePost({required UserDataModel model}) async {
    urlPath = '/EditUserAccount';
    var modelData = model.results;
    final body = {
      "userId": modelData.userId,
      "firstName": modelData.firstName,
      "lastName": modelData.lastName,
      "email": modelData.email,
      "password": modelData.password,
      "userLocation": {
        "location": modelData.lastName,
        "coordinates": modelData.lastName
      }
    };
    Uri uri = Uri.http(baseUrl, urlPath);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await postResponse(uri, body);
  }

  //------------------------------------------------------------------------------global requests
  Future<dynamic> globalGetRequest({
    required String src,
    required int Id,
  }) async {
    urlPath = '/Get$src';
    final requestParameters = {"Id": Id.toString()};
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
    if (!shouldDisplayInLogger) {
      loggerInfo(message: "URI: $Uri");
    }
  }
}
