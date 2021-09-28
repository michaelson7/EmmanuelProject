import 'StationStatisticsModel.dart';

class StationsModel {
  StationsModel({
    this.errorMessage,
    required this.error,
    required this.results,
  });

  dynamic errorMessage;
  bool error;
  List<Result> results;

  factory StationsModel.fromJson(Map<String, dynamic> json) => StationsModel(
        errorMessage: json["errorMessage"],
        error: json["error"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errorMessage": errorMessage,
        "error": error,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.imageFile,
    required this.stationStatisticsModel,
  });

  int id;
  String title;
  String imagePath;
  dynamic imageFile;
  StationStatisticsModel stationStatisticsModel;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        imagePath: json["imagePath"],
        imageFile: json["imageFile"],
        stationStatisticsModel:
            StationStatisticsModel.fromJson(json["stationStatisticsModel"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "imagePath": imagePath,
        "imageFile": imageFile,
        "stationStatisticsModel": stationStatisticsModel.toJson(),
      };
}
