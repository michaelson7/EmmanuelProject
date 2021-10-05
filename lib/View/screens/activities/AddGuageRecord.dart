import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/Model/core/GaugeStationModel.dart';
import 'package:flutter_project/Provider/GaugeRecordsProvider.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/widgets/inputCard.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';
import 'package:flutter_project/View/widgets/outlinedTextFormField.dart';

class AddGuageRecord extends StatefulWidget {
  final GaugeStationModel gaugeStationMode;
  final GaugeRecordsModel? gaugeRecordsModel;
  AddGuageRecord({required this.gaugeStationMode, this.gaugeRecordsModel});

  @override
  _AddGuageRecordState createState() => _AddGuageRecordState();
}

class _AddGuageRecordState extends State<AddGuageRecord> {
  var stationController = TextEditingController(),
      uploaderIdController = TextEditingController(),
      gpsLocationController = TextEditingController(),
      waterLevelController = TextEditingController(),
      temperatureController = TextEditingController(),
      riverFlowController = TextEditingController(),
      guageNameController = TextEditingController(),
      guageIdController = TextEditingController();
  GaugeRecordsProvider _gaugeRecordsProvider = GaugeRecordsProvider();
  final _key = GlobalKey<FormState>();

  void initData() {
    uploaderIdController.text = '1';
    gpsLocationController.text = '0000-00000-0000-0000';

    guageIdController.text = widget.gaugeStationMode.id.toString();
    guageNameController.text = widget.gaugeStationMode.title;
    stationController.text =
        widget.gaugeStationMode.stationsModel!.title.toString();

    if (widget.gaugeRecordsModel != null) {
      waterLevelController.text =
          widget.gaugeRecordsModel!.waterlevel.toString();
      temperatureController.text =
          widget.gaugeRecordsModel!.temperature.toString();
      riverFlowController.text = widget.gaugeRecordsModel!.riverFlow.toString();
    }
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
        title: Text(stationController.text),
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
      child: Form(
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
              title: 'Gauge Reader Name',
              controller: guageNameController,
            )
          ],
        ),
      ),
    );
  }

  ReaderRecords() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Record Details', style: kTextStyleHeader2),
            SizedBox(height: 15),
            inputCard(
              title: 'Water Level',
              controller: waterLevelController,
            ),
            inputCard(
              title: 'Temperature',
              controller: temperatureController,
            ),
            inputCard(
              title: 'River Flow',
              controller: riverFlowController,
            )
          ],
        ),
      ),
    );
  }

  ButtonHandler() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (_key.currentState!.validate()) {
            AlertDialog alert = AlertDialog(
              title: Text("Record Upload"),
              content: Text("Are you sure you want to upload this record?"),
              actions: [
                cancelButton(),
                continueButton(),
              ],
            );
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              },
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Submit'),
        ),
      ),
    );
  }

  Widget cancelButton() => ElevatedButton(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

  Widget continueButton() => ElevatedButton(
        child: Text("Continue"),
        onPressed: () async {
          //Navigator.popAndPushNamed(context, HomeActivity.id);
          var data = GaugeRecordsModel(
            id: 0,
            uploaderId: int.parse(uploaderIdController.text),
            gpsLocation: gpsLocationController.text,
            waterlevel: waterLevelController.text.toString(),
            temperature: temperatureController.text.toString(),
            riverFlow: riverFlowController.text.toString(),
            gaugeId: int.parse(guageIdController.text),
            approval: false,
            approverId: 0,
            timestamp: null,
            uploaderModel: null,
            approverModel: null,
            gaugeStationModel: null,
          );
          var response = await _gaugeRecordsProvider.GaugeRecordsHandler(
            modelData: data,
          );
          loggerAccent(message: response.toJson().toString());
          Navigator.of(context).pop();
        },
      );
}
