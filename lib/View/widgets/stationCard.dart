import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/StationsModel.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/screens/activities/HistoricalDataActivity.dart';
import 'package:flutter_project/View/screens/activities/stationRecords.dart';
import 'package:get/get.dart';
import 'ImageCardBackground.dart';
import 'horizontalWidgetBuilder.dart';

horizontalCardBuilder({
  required BuildContext context,
  required List<StationsModel>? modelData,
}) {
  List<Widget> widgetList = [];
  for (var data in modelData!) {
    var interface = stationCardDesign(context: context, stationsModel: data);
    widgetList.add(interface);
  }
  var horizontalStyle = horizontalWidgetBuilder(widgetList);
  return horizontalStyle;
}

gridCardBuilder(
    {required BuildContext context,
    required List<StationsModel>? modelData,
    bool openHistorical = false}) {
  var size = MediaQuery.of(context).size;
  final double itemHeight = 210;
  final double itemWidth = size.width / 2;

  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: (itemWidth / itemHeight),
    ),
    itemCount: modelData!.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(4.0),
    itemBuilder: (BuildContext context, int index) {
      return stationCardDesign(
        context: context,
        stationsModel: modelData[index],
        openHistorical: openHistorical,
      );
    },
  );
}

Card stationCardDesign({
  required BuildContext context,
  required StationsModel stationsModel,
  bool openHistorical = false,
}) {
  return Card(
    color: kCardBackground,
    elevation: 5,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => openHistorical
                ? HistoricalDataActivity(stationsModel)
                : StationGaugeRecords(stationsModel),
          ),
        );
      },
      child: Container(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageCardBackground(
              width: double.infinity,
              height: 150,
              imgPath: stationsModel.imagePath,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  stationsModel.title,
                  softWrap: true,
                  maxLines: 2,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
