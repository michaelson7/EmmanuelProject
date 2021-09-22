import 'network_helper.dart';

dynamic getResponse(Uri uri) async {
  NetworkHelper networkHelper = NetworkHelper(uriPath: uri);
  try {
    final response = await networkHelper.getResponse();
    return response;
  } catch (e) {
    throw Exception('Error while parsing get-response: $e');
  }
}

dynamic postResponse(Uri uri, Map<String, dynamic> body) async {
  NetworkHelper networkHelper = NetworkHelper(uriPath: uri, requestBody: body);
  try {
    final response = await networkHelper.postResponse();
    return response;
  } catch (e) {
    throw Exception('Error while parsing post-response: $e');
  }
}
