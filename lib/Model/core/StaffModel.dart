import 'StationsModel.dart';
import 'UsersModel.dart';

class StaffModel {
  StaffModel({
    required this.id,
    required this.salary,
    required this.userId,
    required this.stationId,
    required this.usersModel,
    required this.stationsModel,
  });

  int id;
  dynamic salary;
  int userId;
  int stationId;
  UsersModel? usersModel;
  StationsModel? stationsModel;

  factory StaffModel.fromJson(Map<String, dynamic> json) => StaffModel(
        id: json["id"],
        salary: json["salary"],
        userId: json["userId"],
        stationId: json["stationId"],
        usersModel: UsersModel.fromJson(json["usersModel"]),
        stationsModel: StationsModel.fromJson(json["stationsModel"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "salary": salary,
        "userId": userId,
        "stationId": stationId,
        "usersModel": usersModel!.toJson(),
        "stationsModel": stationsModel!.toJson(),
      };
}
