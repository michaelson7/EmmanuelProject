import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/screens/activities/AddGuageRecord.dart';

guageRecordCard(
    {required BuildContext context,
    required int guageRecordId,
    required String guageStationName,
    required GaugeRecordsModel modelData}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Material(
      color: kCardBackground,
      borderRadius: kBorderRadiusCircular,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddGuageRecord(
                guageStationName: guageStationName,
                guageRecordId: guageRecordId,
              ),
            ),
          );
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
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: kBorderRadiusCircular,
                          child: CachedNetworkImage(
                            imageUrl: modelData.imagepath,
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
                            heading: 'Date Uploaded',
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
