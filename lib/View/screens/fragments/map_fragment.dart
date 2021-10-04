import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/widgets/ImageCardBackground.dart';
import 'package:flutter_project/View/widgets/mapMarkers.dart';
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
        center: LatLng(-15.3868807, 28.3478416),
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
            mapMarkers(
              latitude: -15.366280295073386,
              longitude: 28.312143003734874,
              title: 'Zambezi Dam',
            ),
            mapMarkers(
              latitude: -15.405354,
              longitude: 28.313056,
              title: 'Kariba Dam',
            ),
            mapMarkers(
              latitude: -15.400358,
              longitude: 28.323056,
              title: 'Lusaka Dam',
            ),
          ],
        ),
      ],
    );
  }
}
