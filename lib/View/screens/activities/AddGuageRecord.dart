import 'package:flutter/material.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/widgets/outlinedTextFormField.dart';

class AddGuageRecord extends StatefulWidget {
  final int guageRecordId;
  final String guageStationName;

  AddGuageRecord({
    required this.guageRecordId,
    required this.guageStationName,
  });

  @override
  _AddGuageRecordState createState() => _AddGuageRecordState();
}

class _AddGuageRecordState extends State<AddGuageRecord> {
  var stationController = TextEditingController();

  void initData() {
    stationController.text = widget.guageStationName;
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.guageStationName),
      ),
      body: SafeArea(
        child: mainBody(),
      ),
    );
  }

  mainBody() {
    //station indo
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            imageHandler(),
            StationInfoCard(),
            ReaderRecords(),
            ButtonHandler(),
          ],
        ),
      ),
    );
  }

  imageHandler() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1628191013085-990d39ec25b8?ixid=MnwxMjA3fD'
              'F8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
        ),
      ),
    );
  }

  StationInfoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Station Details', style: kTextStyleHeader2),
          SizedBox(height: 15),
          inputCard(
            title: 'Station Name',
            controller: stationController,
          ),
          inputCard(
            title: 'Guage Reader Name',
            controller: stationController,
          )
        ],
      ),
    );
  }

  ReaderRecords() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Record Details', style: kTextStyleHeader2),
          SizedBox(height: 15),
          inputCard(
            title: 'Water Level',
            controller: stationController,
          ),
          inputCard(
            title: 'Temperature',
            controller: stationController,
          ),
          inputCard(
            title: 'River Flow',
            controller: stationController,
          )
        ],
      ),
    );
  }

  ButtonHandler() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Submit'),
        ),
      ),
    );
  }

  Material inputCard({
    required String title,
    required TextEditingController controller,
  }) {
    return Material(
      child: Container(
        child: outlinedTextFormField(
          title: title,
          errorText: 'Please input Data',
          controller: controller,
          returnedParameter: (value) {
            //userName = value;
          },
        ),
      ),
    );
  }
}
