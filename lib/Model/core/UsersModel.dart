import 'RolesModel.dart';

class UsersModel {
  UsersModel({
    this.errorMessage,
    required this.error,
    required this.results,
  });

  dynamic errorMessage;
  bool error;
  List<Result> results;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
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
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.roleId,
    required this.timestamp,
    required this.rolesModel,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String password;
  int roleId;
  DateTime timestamp;
  RolesModel rolesModel;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        roleId: json["roleId"],
        timestamp: DateTime.parse(json["timestamp"]),
        rolesModel: RolesModel.fromJson(json["rolesModel"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "roleId": roleId,
        "timestamp": timestamp.toIso8601String(),
        "rolesModel": rolesModel.toJson(),
      };
}
