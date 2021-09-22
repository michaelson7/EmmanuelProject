import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/widgets/ImageCardBackground.dart';
import 'package:flutter_project/View/widgets/stationCard.dart';
import 'package:latlong2/latlong.dart';

class MapFragment extends StatefulWidget {
  const MapFragment({Key? key}) : super(key: key);

  @override
  _MapFragmentState createState() => _MapFragmentState();
}

class _MapFragmentState extends State<MapFragment> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          attributionBuilder: (_) {
            return Text("© OpenStreetMap contributors");
          },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(51.5, -0.09),
              builder: (ctx) => Container(
                child: FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    );
    ;
  }
}
