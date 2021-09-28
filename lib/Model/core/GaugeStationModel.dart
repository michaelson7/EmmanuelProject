import 'StationsModel.dart';

class GaugeStationModel {
  GaugeStationModel({
    this.errorMessage,
    required this.error,
    required this.results,
  });

  dynamic errorMessage;
  bool error;
  List<Result> results;

  factory GaugeStationModel.fromJson(Map<String, dynamic> json) =>
      GaugeStationModel(
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
    required this.stationId,
    required this.stationsModel,
  });

  int id;
  String title;
  int stationId;
  StationsModel stationsModel;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        stationId: json["stationId"],
        stationsModel: StationsModel.fromJson(json["stationsModel"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "stationId": stationId,
        "stationsModel": stationsModel.toJson(),
      };
}
