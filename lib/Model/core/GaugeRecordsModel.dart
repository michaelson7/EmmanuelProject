import 'package:flutter_project/Model/core/UsersModel.dart';

import 'GaugeStationModel.dart';

class GaugeRecordsModel {
  GaugeRecordsModel({
    this.errorMessage,
    required this.error,
    required this.results,
  });

  dynamic errorMessage;
  bool error;
  List<Result> results;

  factory GaugeRecordsModel.fromJson(Map<String, dynamic> json) =>
      GaugeRecordsModel(
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
    required this.uploaderId,
    required this.imagepath,
    required this.gpsLocation,
    required this.waterlevel,
    required this.temperature,
    required this.riverFlow,
    required this.gaugeId,
    required this.approval,
    required this.approverId,
    required this.timestamp,
    required this.uploaderModel,
    required this.approverModel,
    required this.gaugeStationModel,
    required this.imageFile,
  });

  int id;
  int uploaderId;
  String imagepath;
  String gpsLocation;
  int waterlevel;
  int temperature;
  int riverFlow;
  int gaugeId;
  bool approval;
  int approverId;
  DateTime timestamp;
  UsersModel uploaderModel;
  UsersModel approverModel;
  GaugeStationModel gaugeStationModel;
  dynamic imageFile;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        uploaderId: json["uploaderId"],
        imagepath: json["imagepath"],
        gpsLocation: json["gpsLocation"],
        waterlevel: json["waterlevel"],
        temperature: json["temperature"],
        riverFlow: json["riverFlow"],
        gaugeId: json["gaugeId"],
        approval: json["approval"],
        approverId: json["approverId"],
        timestamp: DateTime.parse(json["timestamp"]),
        uploaderModel: UsersModel.fromJson(json["uploaderModel"]),
        approverModel: UsersModel.fromJson(json["approverModel"]),
        gaugeStationModel:
            GaugeStationModel.fromJson(json["gaugeStationModel"]),
        imageFile: json["imageFile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uploaderId": uploaderId,
        "imagepath": imagepath,
        "gpsLocation": gpsLocation,
        "waterlevel": waterlevel,
        "temperature": temperature,
        "riverFlow": riverFlow,
        "gaugeId": gaugeId,
        "approval": approval,
        "approverId": approverId,
        "timestamp": timestamp.toIso8601String(),
        "uploaderModel": uploaderModel.toJson(),
        "approverModel": approverModel.toJson(),
        "gaugeStationModel": gaugeStationModel.toJson(),
        "imageFile": imageFile,
      };
}
