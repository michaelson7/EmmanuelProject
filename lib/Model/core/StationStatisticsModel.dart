class StationStatisticsModel {
  StationStatisticsModel({
    this.errorMessage,
    required this.error,
    required this.results,
  });

  dynamic errorMessage;
  bool error;
  List<Result> results;

  factory StationStatisticsModel.fromJson(Map<String, dynamic> json) =>
      StationStatisticsModel(
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
    required this.stationId,
    required this.coordinates,
    required this.location,
  });

  int id;
  int stationId;
  String coordinates;
  String location;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        stationId: json["stationId"],
        coordinates: json["coordinates"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stationId": stationId,
        "coordinates": coordinates,
        "location": location,
      };
}
