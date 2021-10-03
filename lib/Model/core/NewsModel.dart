import 'package:flutter_project/View/constants/constants.dart';

import 'UsersModel.dart';

class NewsModel {
  NewsModel({
    required this.id,
    required this.heading,
    this.imagePath,
    required this.message,
    required this.userId,
    this.imageFile,
    required this.usersModel,
  });

  int id;
  dynamic heading;
  dynamic imagePath;
  dynamic message;
  int userId;
  dynamic imageFile;
  UsersModel? usersModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        heading: json["heading"],
        imagePath: kImageUrl + json["imagePath"],
        message: json["message"],
        userId: json["userId"],
        imageFile: json["imageFile"],
        usersModel: UsersModel.fromJson(json["usersModel"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "heading": heading,
        "imagePath": imagePath,
        "message": message,
        "userId": userId,
        "imageFile": imageFile,
        "usersModel": usersModel!.toJson(),
      };
}
