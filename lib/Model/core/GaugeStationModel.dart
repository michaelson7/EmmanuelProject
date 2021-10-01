import 'StationsModel.dart';

class GaugeStationModel {
  GaugeStationModel({
    required this.id,
    required this.title,
    required this.stationId,
    required this.stationsModel,
  });

  int id;
  dynamic title;
  int stationId;
  StationsModel? stationsModel;

  factory GaugeStationModel.fromJson(Map<String, dynamic> json) =>
      GaugeStationModel(
        id: json["id"],
        title: json["title"],
        stationId: json["stationId"],
        stationsModel: StationsModel.fromJson(json["stationsModel"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "stationId": stationId,
        "stationsModel": stationsModel!.toJson(),
      };
}
