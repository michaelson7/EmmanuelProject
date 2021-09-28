import 'package:flutter/material.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/screens/activities/AddGuageRecord.dart';

guageRecordCard({
  required BuildContext context,
  required int guageRecordId,
  required String guageStationName,
}) {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date Time'),
                    Text('StationName'),
                    Text('Flow'),
                    Text('Temp'),
                    Text('Water Level'),
                  ],
                ),
                Column(
                  children: [
                    Text('Approval Status'),
                    Text(
                      'Approved',
                      style: TextStyle(color: Colors.green),
                    ),
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
