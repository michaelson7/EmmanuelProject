class RolesModel {
  RolesModel({
    required this.id,
    required this.title,
  });

  int id;
  String title;

  factory RolesModel.fromJson(Map<String, dynamic> json) => RolesModel(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
