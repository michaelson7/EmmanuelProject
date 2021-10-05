import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_project/Model/core/GaugeStationModel.dart';
import 'package:flutter_project/Model/core/StationsModel.dart';
import 'package:flutter_project/Provider/GuageStationProvider.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/widgets/ImageCardBackground.dart';
import 'package:flutter_project/View/widgets/listTileCard.dart';
import 'package:flutter_project/View/widgets/statCard.dart';

import 'GuageReaderRecords.dart';

class StationGaugeRecords extends StatefulWidget {
  static String id = "StationGaugeRecords";
  final StationsModel stationsModel;

  StationGaugeRecords(this.stationsModel);

  @override
  _StationGuageRecordsState createState() =>
      _StationGuageRecordsState(stationsModel);
}

class _StationGuageRecordsState extends State<StationGaugeRecords> {
  final StationsModel stationsModel;
  GaugeStationProvider _gaugeStationProvider = GaugeStationProvider();

  _StationGuageRecordsState(this.stationsModel);

  void loadData() async {
    await _gaugeStationProvider.stationGetGuages(id: stationsModel.id);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(stationsModel.title),
              background: imageCardBackground(
                width: double.infinity,
                height: 350.0,
                imgPath: stationsModel.imagePath,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: StreamBuilder(
                stream: _gaugeStationProvider.gaugeStationListController,
                builder: (
                  context,
                  AsyncSnapshot<List<GaugeStationModel>> snapshot,
                ) {
                  if (snapshot.hasData) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            statsSection(),
                            guageStationSection(snapshot.data)
                          ],
                        ),
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }

  statsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                statCard(
                  iconData: FontAwesome.book,
                  value: "5",
                ),
                statCard(
                  iconData: FontAwesome5Solid.thermometer,
                  value: "25°",
                ),
                statCard(
                  iconData: FontAwesome5Solid.water,
                  value: "35 km/s",
                ),
                statCard(
                    iconData: FontAwesome5Solid.tachometer_alt, value: "54"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  guageStationSection(List<GaugeStationModel>? data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hydrometric Stations',
            style: kTextStyleHeader1,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: data!.length,
            itemBuilder: (BuildContext context, int index) {
              var modelData = data[index];
              return listTileCard(
                  title: modelData.title,
                  subheading: 'Record ID: ${modelData.id}',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GuageRecords(modelData),
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
