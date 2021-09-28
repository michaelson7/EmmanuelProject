import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/widgets/guageRecordCard.dart';

import 'AddGuageRecord.dart';

class GuageRecords extends StatefulWidget {
  final int guageStationId;
  final String stationName;
  const GuageRecords({
    Key? key,
    required this.guageStationId,
    required this.stationName,
  }) : super(key: key);

  @override
  _GuageRecordsState createState() =>
      _GuageRecordsState(guageStationId, stationName);
}

class _GuageRecordsState extends State<GuageRecords> {
  final int guageStationId;
  final String stationName;
  _GuageRecordsState(this.guageStationId, this.stationName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stationName),
      ),
      body: SafeArea(
        child: mainBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddGuageRecord(
                guageStationName: stationName,
                guageRecordId: guageStationId,
              ),
            ),
          );
        },
        child: const Icon(FontAwesome5Solid.plus),
        backgroundColor: kAccent,
      ),
    );
  }

  mainBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return guageRecordCard(
              context: context,
              guageStationName: stationName,
              guageRecordId: 1,
            );
          },
        ),
      ),
    );
  }
}
