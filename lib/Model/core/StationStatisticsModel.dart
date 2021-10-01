class StationStatisticsModel {
  StationStatisticsModel({
    required this.id,
    required this.stationId,
    required this.coordinates,
    required this.location,
  });

  int id;
  int stationId;
  dynamic coordinates;
  dynamic location;

  factory StationStatisticsModel.fromJson(Map<String, dynamic> json) =>
      StationStatisticsModel(
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
