import 'GaugeStationModel.dart';
import 'UsersModel.dart';

class GaugeRecordsModel {
  GaugeRecordsModel({
    required this.id,
    required this.uploaderId,
    this.imagepath,
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
    this.imageFile,
  });

  int id;
  int uploaderId;
  dynamic imagepath;
  dynamic gpsLocation;
  dynamic waterlevel;
  dynamic temperature;
  dynamic riverFlow;
  int gaugeId;
  bool approval;
  int approverId;
  DateTime timestamp;
  UsersModel uploaderModel;
  UsersModel approverModel;
  GaugeStationModel gaugeStationModel;
  dynamic imageFile;

  factory GaugeRecordsModel.fromJson(Map<String, dynamic> json) =>
      GaugeRecordsModel(
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
