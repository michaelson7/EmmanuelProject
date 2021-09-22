import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Uri uriPath;
  final requestBody;
  NetworkHelper({required this.uriPath, this.requestBody});

  Future getResponse() async {
    try {
      var headers = <String, String>{"Access-Control-Allow-Origin": "*"};
      http.Response response = await http.get(uriPath, headers: headers);
      print(response.statusCode);
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
      http.Response response = await http.post(uriPath, body: requestBody);
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
}
