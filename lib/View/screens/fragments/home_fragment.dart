import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_project/Model/core/StationsModel.dart';
import 'package:flutter_project/Provider/StationsProvider.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/widgets/ImageCardBackground.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';
import 'package:flutter_project/View/widgets/snapShotBuilder.dart';
import 'package:flutter_project/View/widgets/stationCard.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  StationsProvider _stationsProvider = StationsProvider();
  bool isLoading = true;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    _stationsProvider.dispose();
    super.dispose();
  }

  Future<void> loadData() async {
    await _stationsProvider.getAllStations();
    setState(() => isLoading = !isLoading);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  introHeader(),
                  recentUpdatesSection(),
                  stationsSection(),
                ],
              )),
            ),
          );
  }

  introHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text('Hello,', style: kTextStyleHeader1),
        Text('Lets get started', style: kTextStyleHint),
        SizedBox(height: 8),
        Material(
          borderRadius: kBorderRadiusCircular,
          color: kCardBackground,
          child: InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              child: ListTile(
                leading: Icon(
                  FontAwesome.search,
                  color: Colors.grey,
                ),
                title: Text('Search for station', style: kTextStyleHint),
              ),
            ),
          ),
        )
      ],
    );
  }

  recentUpdatesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Updates', style: kTextStyleHeader2),
          SizedBox(height: 5),
          StreamBuilder(
            stream: _stationsProvider.stationsListController,
            builder: (context, AsyncSnapshot<List<StationsModel>> snapshot) {
              if (snapshot.hasData) {
                return horizontalCardBuilder(
                  context: context,
                  modelData: snapshot.data,
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }

  stationsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Stations', style: kTextStyleHeader2),
          SizedBox(height: 5),
          StreamBuilder(
            stream: _stationsProvider.stationsListController,
            builder: (context, AsyncSnapshot<List<StationsModel>> snapshot) {
              if (snapshot.hasData) {
                return gridCardBuilder(
                  context: context,
                  modelData: snapshot.data,
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
