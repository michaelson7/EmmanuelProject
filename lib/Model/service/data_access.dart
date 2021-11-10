import 'network_helper.dart';

dynamic getResponse(Uri uri) async {
  NetworkHelper networkHelper = NetworkHelper(uriPath: uri);
  try {
    final response = await networkHelper.getResponse();
    return response;
  } catch (e) {
    throw Exception('Error while parsing get-response: $e\n@$uri');
  }
}

dynamic postResponse(Uri uri, dynamic body) async {
  NetworkHelper networkHelper = NetworkHelper(uriPath: uri, requestBody: body);
  try {
    final response = await networkHelper.postResponse();
    return response;
  } catch (e) {
    throw Exception('Error while parsing post-response: $e');
  }
}

dynamic postFileResponse(Uri uri, dynamic body) async {
  NetworkHelper networkHelper = NetworkHelper(uriPath: uri, requestBody: body);
  try {
    final response = await networkHelper.postFileResponse();
    return response;
  } catch (e) {
    throw Exception('Error while parsing post-file-response: $e');
  }
}
