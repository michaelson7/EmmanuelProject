enum dbOperations {
  get,
  create,
  update,
  getAll,
}

enum UserDetails { userName, userEmail, userId, userAccount }
enum UserStation { stationID }

String getEnumValue(var enumValue) {
  String data =
      enumValue.toString().substring(enumValue.toString().indexOf('.') + 1);
  return data;
}
