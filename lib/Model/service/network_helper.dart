import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Uri uriPath;
  final requestBody;
  NetworkHelper({required this.uriPath, this.requestBody});

  Future getResponse() async {
    try {
      var headers = <String, String>{"Access-Control-Allow-Origin": "*"};
      http.Response response = await http.get(uriPath, headers: headers);
      if (response.statusCode == 200) {
        final responseBody = response.body;
        final decodedJson = jsonDecode(responseBody);
        return decodedJson;
      } else {
        throw Exception('Error while Getting response: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network Error [Get-failure]: $e');
    }
  }

  Future postResponse() async {
    try {
      var headers = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      };
      var body = json.encode(requestBody);
      http.Response response = await http.post(
        uriPath,
        body: body,
        headers: headers,
      );
      if (response.statusCode == 200) {
        final responseBody = response.body;
        final decodedJson = jsonDecode(responseBody);
        return decodedJson;
      } else {
        throw Exception('Error while Posting response: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network Error [Post-failure]: $e');
    }
  }

  Future postFileResponse() async {
    try {
      Dio dio = new Dio();
      var response = await dio.post(
        uriPath.toString(),
        options: Options(contentType: 'multipart/form-data'),
        data: requestBody,
      );
      if (response.statusCode == 200) {
        final responseBody = response.toString();
        final decodedJson = jsonDecode(responseBody);
        return decodedJson;
      } else {
        throw Exception('Error while Posting response: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network Error [Post File-failure]: $e');
    }
  }
}
