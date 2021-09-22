class UserDataModel {
  UserDataModel({
    this.errorMessage,
    required this.error,
    required this.results,
  });

  dynamic errorMessage;
  bool error;
  Results results;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        errorMessage: json["errorMessage"],
        error: json["error"],
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "errorMessage": errorMessage,
        "error": error,
        "results": results.toJson(),
      };
}

class Results {
  Results({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  int userId;
  String firstName;
  String lastName;
  String email;
  String password;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password
      };
}
