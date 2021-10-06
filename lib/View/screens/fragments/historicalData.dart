import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/StationsModel.dart';
import 'package:flutter_project/Provider/StationsProvider.dart';
import 'package:flutter_project/View/widgets/stationCard.dart';

class HistoricalDataFragment extends StatefulWidget {
  const HistoricalDataFragment({Key? key}) : super(key: key);

  @override
  _HistoricalDataFragmentState createState() => _HistoricalDataFragmentState();
}

class _HistoricalDataFragmentState extends State<HistoricalDataFragment> {
  StationsProvider _stationsProvider = StationsProvider();
  bool isLoading = true;

  Future<void> getData() async {
    await _stationsProvider.getAllStations();
    setState(() => isLoading = !isLoading);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _stationsProvider.stationsListController,
      builder: (context, AsyncSnapshot<List<StationsModel>> snapshot) {
        if (snapshot.hasData) {
          return gridCardBuilder(
            context: context,
            modelData: snapshot.data,
            openHistorical: true,
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
