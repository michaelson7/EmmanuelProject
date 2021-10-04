import 'package:flutter_project/View/constants/constants.dart';
import 'StationStatisticsModel.dart';

class StationsModel {
  StationsModel({
    required this.id,
    required this.title,
    this.imagePath,
    this.imageFile,
    required this.stationStatisticsModel,
  });

  int id;
  dynamic title;
  dynamic imagePath;
  dynamic imageFile;
  StationStatisticsModel? stationStatisticsModel;

  factory StationsModel.fromJson(Map<String, dynamic> json) => StationsModel(
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
        "stationStatisticsModel": stationStatisticsModel!.toJson(),
      };
}
