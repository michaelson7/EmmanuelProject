import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/Model/core/StationsModel.dart';
import 'package:flutter_project/Provider/GaugeRecordsProvider.dart';
import 'package:flutter_project/Provider/GuageStationProvider.dart';
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
  GaugeRecordsProvider _gaugeRecordsProvider = GaugeRecordsProvider();
  GaugeStationProvider _gaugeStationProvider = GaugeStationProvider();

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
    var gaugeData = await _gaugeStationProvider.stationGetGuages(
      id: stationsModel.id,
    );
    if (gaugeData != null) {
      for (var data in gaugeData) {
        var results = await _gaugeRecordsProvider.getGaugeRecords(data.id);
        if (results != null) {
          getTemperatureData(results);
          getFlowData(results);
          getLevelData(results);
        }
      }
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

  void getTemperatureData(List<GaugeRecordsModel> results) {
    setState(() {
      for (var data in results) {
        var tempDataValues = _chartData(
          month: data.id.toString(),
          value: data.temperature,
        );
        tempData.add(tempDataValues);
      }

      tempDataValues = [
        LineSeries<_chartData, String>(
          dataSource: tempData,
          xValueMapper: (_chartData temps, _) => temps.month,
          yValueMapper: (_chartData temps, _) => temps.value,
          name: '2011',
          dataLabelSettings: DataLabelSettings(isVisible: false),
        ),
      ];
    });
  }

  void getFlowData(List<GaugeRecordsModel> results) {
    setState(() {
      for (var data in results) {
        var tempDataValues = _chartData(
          month: data.id.toString(),
          value: data.riverFlow,
        );
        flowData.add(tempDataValues);
      }

      flowDataValues = [
        LineSeries<_chartData, String>(
          dataSource: flowData,
          xValueMapper: (_chartData temps, _) => temps.month,
          yValueMapper: (_chartData temps, _) => temps.value,
          name: '2011',
          dataLabelSettings: DataLabelSettings(isVisible: false),
        ),
      ];
    });
  }

  void getLevelData(List<GaugeRecordsModel> results) {
    setState(() {
      for (var data in results) {
        var tempDataValues = _chartData(
          month: data.id.toString(),
          value: data.waterlevel,
        );
        levelData.add(tempDataValues);
      }

      levelDataValues = [
        LineSeries<_chartData, String>(
          dataSource: levelData,
          xValueMapper: (_chartData temps, _) => temps.month,
          yValueMapper: (_chartData temps, _) => temps.value,
          name: '2011',
          dataLabelSettings: DataLabelSettings(isVisible: false),
        ),
      ];
    });
  }
}

class _chartData {
  _chartData({required this.month, required this.value});
  final String month;
  final double value;
}
