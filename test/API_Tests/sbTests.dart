import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/Model/core/GaugeStationModel.dart';
import 'package:flutter_project/Model/core/NewsModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/StaffModel.dart';
import 'package:flutter_project/Model/core/StationStatisticsModel.dart';
import 'package:flutter_project/Model/core/StationsModel.dart';
import 'package:flutter_project/Model/core/UsersModel.dart';
import 'package:flutter_project/Provider/GaugeRecordsProvider.dart';
import 'package:flutter_project/Provider/GuageStationProvider.dart';
import 'package:flutter_project/Provider/NewsProvider.dart';
import 'package:flutter_project/Provider/StaffProvider.dart';
import 'package:flutter_project/Provider/StationStatisticsProvider.dart';
import 'package:flutter_project/Provider/StationsProvider.dart';
import 'package:flutter_project/Provider/UsersProvider.dart';
import 'package:flutter_project/Provider/rolesProvider.dart';
import 'package:flutter_project/View/screens/activities/GuageReaderRecords.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';
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
    RolesModel data = RolesModel(id: 3, title: 'create Sample');
    await _rolesProvider.getRoles(3);
    await _rolesProvider.getAllRoles();
    var requestResult = await _rolesProvider.rolesHandler(modelData: data);
    data = RolesModel(id: requestResult.results, title: 'updated class');
    await _rolesProvider.rolesHandler(modelData: data, shouldUpdate: true);
  });

  test('_gaugeRecordsProviderTests', () async {
    var userData = await _usersProvider.getAllUsers();
    var gaugeData = await _gaugeStationProvider.getAllGaugeStation();
    var data = GaugeRecordsModel(
      id: 4,
      uploaderId: userData!.first.id,
      gpsLocation: '0000-2000-8000-4000',
      waterlevel: 4485,
      temperature: 4485,
      riverFlow: 4485,
      gaugeId: gaugeData!.first.id,
      approval: false,
      approverId: 0,
      timestamp: null,
      uploaderModel: null,
      approverModel: null,
      gaugeStationModel: null,
    );

    await _gaugeRecordsProvider.getGaugeRecords(4);
    await _gaugeRecordsProvider.getAllGaugeRecords();
    await _gaugeRecordsProvider.GaugeRecordsHandler(modelData: data);
    await _gaugeRecordsProvider.GaugeRecordsHandler(
      modelData: data,
      shouldUpdate: true,
    );
  });

  test('_gaugeStation Tests', () async {
    var stationData = await _stationProvider.getAllStations();
    GaugeStationModel data = GaugeStationModel(
      id: 4,
      title: 'Update/Create Sample',
      stationId: stationData!.first.id,
      stationsModel: null,
    );

    await _gaugeStationProvider.getGaugeStation(4);
    await _gaugeStationProvider.getAllGaugeStation();
    await _gaugeStationProvider.GaugeStationHandler(modelData: data);
    await _gaugeStationProvider.GaugeStationHandler(
      modelData: data,
      shouldUpdate: true,
    );
  });

  test('StationsTests', () async {
    // StationsModel modelData = StationsModel(
    //   id: 16,
    //   title: 'Update/Create Sample',
    //   stationStatisticsModel: null,
    // );

    //await _stationProvider.getStations(16);
    //await _stationProvider.getAllStations();
    var data = await _stationProvider.stationStatsGet(16);
    // await _stationProvider.getStationStats(16);
    // await _stationProvider.StationsHandler(modelData: modelData);
    // await _stationProvider.StationsHandler(
    //   modelData: modelData,
    //   shouldUpdate: true,
    // );
  });

  test('_newsProvider Tests', () async {
    // var userData = await _usersProvider.getAllUsers();
    // NewsModel modelData = NewsModel(
    //   id: 3,
    //   heading: 'Header',
    //   message: 'message',
    //   userId: userData!.first.id,
    //   usersModel: null,
    // );
    //await _newsProvider.getNews(3);
    var data = await _newsProvider.getAllNews();
    for (var list in data!) {
      loggerInfo(message: list.toJson().toString());
    }
    // await _newsProvider.NewsHandler(modelData: modelData);
    // await _newsProvider.NewsHandler(
    //   modelData: modelData,
    //   shouldUpdate: true,
    // );
  });

  test('_staffProvider Tests', () async {
    var userData = await _usersProvider.getAllUsers();
    var stationData = await _stationProvider.getAllStations();
    StaffModel modelData = StaffModel(
      id: 5,
      salary: 5000,
      userId: userData!.first.id,
      stationId: stationData!.first.id,
      usersModel: null,
      stationsModel: null,
    );
    await _staffProvider.getStaff(5);
    await _staffProvider.getAllStaff();
    await _staffProvider.StaffHandler(modelData: modelData);
    await _staffProvider.StaffHandler(
      modelData: modelData,
      shouldUpdate: true,
    );
  });

  test('_stationStasProvider Tests', () async {
    var stationData = await _stationProvider.getAllStations();
    StationStatisticsModel modelData = StationStatisticsModel(
      id: 1,
      stationId: stationData!.first.id,
      coordinates: '000-000-0-00',
      location: 'Lusaka',
    );
    await _stationStasProvider.getStationStatistics(1);
    await _stationStasProvider.getAllStationStatistics();
    await _stationStasProvider.StationStatisticsHandler(modelData: modelData);
    await _stationStasProvider.StationStatisticsHandler(
      modelData: modelData,
      shouldUpdate: true,
    );
  });

  test('_usersProvider Tests', () async {
    var roleData = await _rolesProvider.getAllRoles();
    UsersModel modelData = UsersModel(
      id: 1,
      firstName: 'firstName',
      lastName: 'lastName',
      email: '@email.com',
      password: 'password',
      roleId: roleData!.first.id,
      timestamp: null,
      rolesModel: null,
    );
    await _usersProvider.getUsers(1);
    await _usersProvider.getAllUsers();
    await _usersProvider.UsersHandler(modelData: modelData);
    await _usersProvider.UsersHandler(
      modelData: modelData,
      shouldUpdate: true,
    );
  });
}
