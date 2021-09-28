import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/widgets/ImageCardBackground.dart';
import 'package:flutter_project/View/widgets/listTileCard.dart';
import 'package:flutter_project/View/widgets/statCard.dart';

import 'GuageReaderRecords.dart';

class StationGaugeRecords extends StatefulWidget {
  static String id = "StationGaugeRecords";
  final String stationName, imgPath;

  const StationGaugeRecords({
    Key? key,
    required this.stationName,
    required this.imgPath,
  }) : super(key: key);

  @override
  _StationGuageRecordsState createState() => _StationGuageRecordsState(
        stationName: stationName,
        imgPath: imgPath,
      );
}

class _StationGuageRecordsState extends State<StationGaugeRecords> {
  final String stationName, imgPath;

  _StationGuageRecordsState({
    required this.stationName,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(stationName),
              background: imageCardBackground(
                width: double.infinity,
                height: 350.0,
                imgPath: imgPath,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [statsSection(), guageStationSection()],
                ),
              ),
            ),
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

  guageStationSection() {
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
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return listTileCard(
                  title: 'Sample',
                  subheading: 'anotherSample $index',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GuageRecords(
                          guageStationId: 1,
                          stationName: stationName,
                        ),
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