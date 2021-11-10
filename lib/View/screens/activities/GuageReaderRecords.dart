import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/Model/core/GaugeStationModel.dart';
import 'package:flutter_project/Provider/GaugeRecordsProvider.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/widgets/guageRecordCard.dart';

import 'AddGuageRecord.dart';

class GuageRecords extends StatefulWidget {
  GaugeStationModel gaugeStationMode;
  GuageRecords(this.gaugeStationMode);

  @override
  _GuageRecordsState createState() => _GuageRecordsState(gaugeStationMode);
}

class _GuageRecordsState extends State<GuageRecords> {
  GaugeStationModel gaugeStationModel;
  GaugeRecordsModel? gaugeRecordsModel;
  bool isLoading = false;
  GaugeRecordsProvider _gaugeRecordsProvider = GaugeRecordsProvider();

  _GuageRecordsState(this.gaugeStationModel);

  getData() async {
    _gaugeRecordsProvider.getGaugeRecords(gaugeStationModel.id);
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gaugeStationModel.stationsModel!.title),
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
                gaugeRecordsModel: gaugeRecordsModel,
                gaugeStationMode: widget.gaugeStationMode,
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
        child: StreamBuilder(
            stream: _gaugeRecordsProvider.GaugeRecordsListController,
            builder:
                (context, AsyncSnapshot<List<GaugeRecordsModel>> snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var dataValue = data[index];
                    return guageRecordCard(
                      context: context,
                      guageStationName:
                          widget.gaugeStationMode.stationsModel!.title,
                      guageRecordId: 1,
                      modelData: dataValue,
                      gaugeStationMode: widget.gaugeStationMode,
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
