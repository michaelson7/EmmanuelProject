import 'package:flutter_project/Model/core/user_data_model.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';

import 'data_access.dart';

class Api {
  String baseUrl = "10.0.2.2:54150";
  String urlPath = "";

  //------------------------------------------------------------------------------global requests
  Future<dynamic> globalGetRequest({
    required String src,
    required int Id,
  }) async {
    urlPath = '/${src}Get';
    final requestParameters = {"Id": Id.toString()};
    Uri uri = Uri.http(baseUrl, urlPath, requestParameters);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await getResponse(uri);
  }

  Future<dynamic> globalGetAllRequest({required String src}) async {
    urlPath = '/${src}GetAll';
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
    urlPath = '/${src}Delete';
    final requestParameters = {"Id": Id.toString()};
    Uri uri = Uri.http(baseUrl, urlPath, requestParameters);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await getResponse(uri);
  }

  //----------------------------------------------------------------------------------------------custom requests
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
    Uri uri = Uri.https(baseUrl, urlPath);
    displayUriInLogger(
      shouldDisplayInLogger: false,
      Uri: uri.toString(),
    );
    return await postResponse(uri, body);
  }

  void displayUriInLogger({bool shouldDisplayInLogger = false, dynamic Uri}) {
    if (shouldDisplayInLogger) {
      loggerInfo(message: "URI: $Uri");
    }
  }
}
