enum dbOperations {
  get,
  create,
  update,
  getAll,
}

String getEnumValue(var enumValue) {
  String data =
      enumValue.toString().substring(enumValue.toString().indexOf('.') + 1);
  return data;
}
