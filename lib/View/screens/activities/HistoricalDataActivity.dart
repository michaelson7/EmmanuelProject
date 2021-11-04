import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/Model/core/StationStatsModel.dart';
import 'package:flutter_project/Model/core/StationsModel.dart';
import 'package:flutter_project/Provider/GaugeRecordsProvider.dart';
import 'package:flutter_project/Provider/GuageStationProvider.dart';
import 'package:flutter_project/Provider/StationsProvider.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/screens/activities/GuageReaderRecords.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoricalDataActivity extends StatefulWidget {
  final StationsModel stationsModel;
  HistoricalDataActivity(this.stationsModel);

  @override
  _HistoricalDataActivityState createState() =>
      _HistoricalDataActivityState(stationsModel);
}

class _HistoricalDataActivityState extends State<HistoricalDataActivity> {
  final StationsModel stationsModel;
  StationsProvider _stationsProvider = StationsProvider();

  List<_chartData> tempData = [];
  List<_chartData> flowData = [];
  List<_chartData> levelData = [];
  List<ChartSeries<_chartData, String>> tempDataValues = [];
  List<ChartSeries<_chartData, String>> flowDataValues = [];
  List<ChartSeries<_chartData, String>> levelDataValues = [];

  _HistoricalDataActivityState(this.stationsModel);

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    var recordData = await _stationsProvider.getStationStats(stationsModel.id);
    if (recordData != null) {
      getTemperatureData(recordData);
      getFlowData(recordData);
      getLevelData(recordData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stationsModel.title),
      ),
      body: SafeArea(
        child: buildContainer(),
      ),
    );
  }

  buildContainer() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            temperatureSection(),
            flowSection(),
            levelSection(),
          ],
        ),
      ),
    );
  }

  temperatureSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(
              text: 'Average Temperatures (°)',
              alignment: ChartAlignment.near,
              textStyle: kTextStyleHeader2,
            ),
            legend: Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: tempDataValues,
          )
        ],
      ),
    );
  }

  flowSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(
              text: 'Average River Flow (m/s)',
              alignment: ChartAlignment.near,
              textStyle: kTextStyleHeader2,
            ),
            legend: Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: flowDataValues,
          )
        ],
      ),
    );
  }

  levelSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(
              text: 'Average Water Level (m)',
              alignment: ChartAlignment.near,
              textStyle: kTextStyleHeader2,
            ),
            legend: Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: levelDataValues,
          )
        ],
      ),
    );
  }

  void getTemperatureData(List<StationStatsModel> dataObject) {
    setState(() {
      for (var data in dataObject) {
        List<_chartData> dataList = [];
        for (var stats in data.stationStatsModel) {
          var tempDataValuesData = _chartData(
            month: stats.month,
            value: stats.temperature,
          );
          dataList.add(tempDataValuesData);
        }
        var lineData = LineSeries<_chartData, String>(
          dataSource: dataList,
          xValueMapper: (_chartData temps, _) => temps.month,
          yValueMapper: (_chartData temps, _) => temps.value,
          name: data.year,
          dataLabelSettings: DataLabelSettings(isVisible: false),
        );
        tempDataValues.add(lineData);
      }
    });
  }

  void getFlowData(List<StationStatsModel> dataObject) {
    setState(() {
      for (var data in dataObject) {
        List<_chartData> dataList = [];
        for (var stats in data.stationStatsModel) {
          var tempDataValuesData = _chartData(
            month: stats.month,
            value: stats.riverFlow,
          );
          dataList.add(tempDataValuesData);
        }
        var lineData = LineSeries<_chartData, String>(
          dataSource: dataList,
          xValueMapper: (_chartData temps, _) => temps.month,
          yValueMapper: (_chartData temps, _) => temps.value,
          name: data.year,
          dataLabelSettings: DataLabelSettings(isVisible: false),
        );
        flowDataValues.add(lineData);
      }
    });
  }

  void getLevelData(List<StationStatsModel> dataObject) {
    setState(() {
      for (var data in dataObject) {
        List<_chartData> dataList = [];
        for (var stats in data.stationStatsModel) {
          var tempDataValuesData = _chartData(
            month: stats.month,
            value: stats.waterLevel,
          );
          dataList.add(tempDataValuesData);
        }
        var lineData = LineSeries<_chartData, String>(
          dataSource: dataList,
          xValueMapper: (_chartData temps, _) => temps.month,
          yValueMapper: (_chartData temps, _) => temps.value,
          name: data.year,
          dataLabelSettings: DataLabelSettings(isVisible: false),
        );
        levelDataValues.add(lineData);
      }
    });
  }
}

class _chartData {
  _chartData({required this.month, required this.value});
  final String month;
  final double value;
}
