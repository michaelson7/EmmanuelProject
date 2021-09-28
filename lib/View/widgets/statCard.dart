import 'package:flutter/material.dart';
import 'package:flutter_project/View/constants/constants.dart';

Container statCard({required String value, required IconData iconData}) {
  return Container(
    width: 65,
    height: 65,
    child: Material(
      color: kCardBackground,
      borderRadius: kBorderRadiusCircular,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Colors.grey,
          ),
          SizedBox(height: 10),
          Text(value),
        ],
      ),
    ),
  );
}
