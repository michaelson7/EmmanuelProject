import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Provider/GaugeRecordsProvider.dart';
import 'package:flutter_project/Provider/GuageStationProvider.dart';
import 'package:flutter_project/Provider/NewsProvider.dart';
import 'package:flutter_project/Provider/StaffProvider.dart';
import 'package:flutter_project/Provider/StationStatisticsProvider.dart';
import 'package:flutter_project/Provider/StationsProvider.dart';
import 'package:flutter_project/Provider/UsersProvider.dart';
import 'package:flutter_project/Provider/rolesProvider.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  RolesProvider _rolesProvider = RolesProvider();
  GaugeRecordsProvider _gaugeRecordsProvider = GaugeRecordsProvider();
  GaugeStationProvider _gaugeStationProvider = GaugeStationProvider();
  NewsProvider _newsProvider = NewsProvider();
  StaffProvider _staffProvider = StaffProvider();
  StationsProvider _stationProvider = StationsProvider();
  StationStatisticsProvider _stationStasProvider = StationStatisticsProvider();
  UsersProvider _usersProvider = UsersProvider();

  test('RolesTests', () async {
    RolesModel data = RolesModel(id: 1, title: 'sample android');
    // await _rolesProvider.getRoles(15);
    // await _rolesProvider.getAllRoles();
    await _rolesProvider.rolesHandler(modelData: data);
  });

  test('_gaugeRecordsProviderTests', () async {
    await _gaugeRecordsProvider.getGaugeRecords(4);
    await _gaugeRecordsProvider.getAllGaugeRecords();
  });

  test('_gaugeStation Tests', () async {
    await _gaugeStationProvider.getGaugeStation(4);
    await _gaugeStationProvider.getAllGaugeStation();
  });

  test('StationsTests', () async {
    await _stationProvider.getStations(16);
    await _stationProvider.getAllStations();
  });

  test('_newsProvider Tests', () async {
    await _newsProvider.getNews(3);
    await _newsProvider.getAllNews();
  });

  test('_staffProvider Tests', () async {
    await _staffProvider.getStaff(5);
    await _staffProvider.getAllStaff();
  });

  test('_stationStasProvider Tests', () async {
    await _stationStasProvider.getStationStatistics(1);
    await _stationStasProvider.getAllStationStatistics();
  });

  test('_usersProvider Tests', () async {
    await _usersProvider.getUsers(1);
    await _usersProvider.getAllUsers();
  });
}
