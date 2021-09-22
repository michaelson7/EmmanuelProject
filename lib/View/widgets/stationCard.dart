import 'package:flutter/material.dart';
import 'package:flutter_project/View/constants/constants.dart';

import 'ImageCardBackground.dart';
import 'horizontalWidgetBuilder.dart';

horizontalCardBuilder() {
  List<Widget> widgetList = [];
  for (var i = 0; i < 10; i++) {
    var interface = stationCardDesign(
      title: 'Station Name $i',
    );
    widgetList.add(interface);
  }
  var horizontalStyle = horizontalWidgetBuilder(widgetList);
  return horizontalStyle;
}

gridCardBuilder({required BuildContext context}) {
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
    itemCount: 10,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(4.0),
    itemBuilder: (BuildContext context, int index) {
      return stationCardDesign(
        title: 'Station Name $index',
      );
    },
  );
}

Card stationCardDesign({
  required String title,
  String imagePath =
      "https://images.unsplash.com/photo-1593642634524-b40b5baae6bb?ixid=MnwxMjA3f"
          "DF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=form"
          "at&fit=crop&w=500&q=60",
}) {
  return Card(
    color: kCardBackground,
    elevation: 5,
    child: InkWell(
      onTap: () {},
      child: Container(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageCardBackground(
              width: double.infinity,
              height: 150,
              imgPath: imagePath,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  title,
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
