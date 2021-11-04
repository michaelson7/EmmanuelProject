import 'RolesModel.dart';

class UsersModel {
  UsersModel({
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
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  dynamic password;
  int roleId;
  DateTime? timestamp;
  RolesModel? rolesModel;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        roleId: json["roleId"],
        timestamp: DateTime.parse(json["timestamp"]),
        rolesModel: RolesModel.fromJson(json["rolesData"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "roleId": roleId,
        "timestamp": timestamp!.toIso8601String(),
        "rolesModel": rolesModel!.toJson(),
      };
}
