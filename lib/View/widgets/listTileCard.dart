import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/screens/activities/GuageReaderRecords.dart';

listTileCard({
  required String title,
  required String subheading,
  required Function function,
}) {
  return InkWell(
    onTap: () => function(),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        leading: Material(
          color: kAccent,
          borderRadius: kBorderRadiusCircular,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(FontAwesome5Solid.tachometer_alt),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: kTextStyleHeader2,
            ),
            Text(subheading),
          ],
        ),
      ),
    ),
  );
}
