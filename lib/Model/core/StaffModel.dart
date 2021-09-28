import 'StationsModel.dart';
import 'UsersModel.dart';

class StaffModel {
  StaffModel({
    this.errorMessage,
    required this.error,
    required this.results,
  });

  dynamic errorMessage;
  bool error;
  List<Result> results;

  factory StaffModel.fromJson(Map<String, dynamic> json) => StaffModel(
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
    required this.salary,
    required this.userId,
    required this.stationId,
    required this.usersModel,
    required this.stationsModel,
  });

  int id;
  int salary;
  int userId;
  int stationId;
  UsersModel usersModel;
  StationsModel stationsModel;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
        "usersModel": usersModel.toJson(),
        "stationsModel": stationsModel.toJson(),
      };
}
