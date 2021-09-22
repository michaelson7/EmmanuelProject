class ResponseModel {
  ResponseModel({
    this.errorMessage,
    required this.error,
    required this.results,
  });

  dynamic errorMessage;
  bool error;
  String results;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    errorMessage: json["errorMessage"],
    error: json["error"],
    results: json["results"],
  );

  Map<String, dynamic> toJson() => {
    "errorMessage": errorMessage,
    "error": error,
    "results": results,
  };
}
