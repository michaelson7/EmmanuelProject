import 'package:flutter_project/Provider/rolesProvider.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  RolesProvider _rolesProvider = RolesProvider();

  test('Get', () async {
    var data = await _rolesProvider.getRoles(1);
    return data;
  });

  test('Get All', () async {
    var data = await _rolesProvider.getAllRoles();
    return data;
  });
}
