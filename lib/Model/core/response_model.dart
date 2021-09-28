class ResponseModel {
  dynamic errorMessage;
  bool error;
  String results;

  ResponseModel({
    this.errorMessage,
    required this.error,
    required this.results,
  });

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
