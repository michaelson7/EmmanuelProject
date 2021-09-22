import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/View/constants/constants.dart';

imageCardBackground(
    {required double width, required double height, required String imgPath}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: const Color(0xc3000000),
      borderRadius: kImageRadiusTop,
      image: DecorationImage(
        image: CachedNetworkImageProvider(imgPath),
        fit: BoxFit.cover,
        colorFilter: new ColorFilter.mode(
          Colors.black.withOpacity(0.5),
          BlendMode.dstATop,
        ),
      ),
    ),
  );
}
