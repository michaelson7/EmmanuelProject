import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/Model/core/GaugeStationModel.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/screens/activities/AddGuageRecord.dart';
import 'package:flutter_project/View/widgets/snackBarBuilder.dart';

guageRecordCard({
  required BuildContext context,
  required int guageRecordId,
  required String accountType,
  required String guageStationName,
  required GaugeRecordsModel modelData,
  required GaugeStationModel gaugeStationMode,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Material(
      color: kCardBackground,
      borderRadius: kBorderRadiusCircular,
      child: InkWell(
        onTap: () {
          if (accountType != "Ordinary Users") {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => AddGuageRecord(
            //       gaugeRecordsModel: modelData,
            //       gaugeStationMode: gaugeStationMode,
            //       update: true,
            //     ),
            //   ),
            // );
          } else {
            snackBarBuilder(
              context: context,
              message: "You do not have access to this page",
            );
          }
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: kBorderRadiusCircular,
                          child: CachedNetworkImage(
                            imageUrl: modelData.imagepath,
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey[900],
                              child: Icon(
                                Icons.error,
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              color: kAccent,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          listTileCard(
                            heading: 'Uploader',
                            value: 'Michael Sama',
                          ),
                          listTileCard(
                            heading: 'Date',
                            value: modelData.timestamp.toString(),
                          ),
                          listTileCard(
                            heading: 'Approval',
                            value: modelData.approval.toString(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Flow: ${modelData.riverFlow}'),
                    Text('Temp: ${modelData.temperature}'),
                    Text('Level: ${modelData.waterlevel}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

ListTile listTileCard({required heading, required value}) {
  return ListTile(
    visualDensity: VisualDensity(
      horizontal: 0,
      vertical: -4,
    ),
    leading: Text(
      '$heading: ',
      style: kTextStyleHint,
    ),
    title: Text(value),
  );
}
