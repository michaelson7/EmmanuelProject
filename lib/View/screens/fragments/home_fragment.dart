import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/widgets/ImageCardBackground.dart';
import 'package:flutter_project/View/widgets/stationCard.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
        Text('Hello User', style: kTextStyleHeader1),
        Text('Lets get started', style: kTextStyleHint),
        SizedBox(height: 8),
        Material(
          borderRadius: kBorderRadiusCircular,
          color: kCardBackground,
          child: InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  leading: Icon(
                    FontAwesome.search,
                    color: Colors.grey,
                  ),
                  title: Text('Search for station', style: kTextStyleHint),
                ),
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
          horizontalCardBuilder()
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
          gridCardBuilder(context: context)
        ],
      ),
    );
  }
}
