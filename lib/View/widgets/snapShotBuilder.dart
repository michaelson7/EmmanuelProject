import 'package:flutter/material.dart';
import 'emptyHandler.dart';

dynamic snapShotBuilder({
  required dynamic snapshot,
  required dynamic widget,
  Widget? shimmer,
  String emptyMessage = "No Products Found",
}) {
  if (snapshot.hasData) {
    return widget;
  }

  return CircularProgressIndicator();
}
