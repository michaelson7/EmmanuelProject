import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/Model/core/GaugeStationModel.dart';
import 'package:flutter_project/Model/service/api.dart';
import 'package:flutter_project/Provider/GaugeRecordsProvider.dart';
import 'package:flutter_project/Provider/SharedPreferenceProvider.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/constants/enums.dart';
import 'package:flutter_project/View/widgets/inputCard.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';
import 'package:flutter_project/View/widgets/outlinedTextFormField.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class AddGuageRecord extends StatefulWidget {
  final GaugeStationModel gaugeStationMode;
  final GaugeRecordsModel? gaugeRecordsModel;
  bool update = false;
  AddGuageRecord({
    required this.gaugeStationMode,
    this.gaugeRecordsModel,
    required this.update,
  });

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
  var imageFile = null;
  SharedPreferenceProvider _sharedPreferenceProvider =
      SharedPreferenceProvider();
  GaugeRecordsProvider _gaugeRecordsProvider = GaugeRecordsProvider();
  final _key = GlobalKey<FormState>();

  Future<void> initData() async {
    var location = await _determinePosition();
    loggerInfo(message: location.toString());

    uploaderIdController.text = '1';
    gpsLocationController.text = location.toString();

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

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
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
    Future<void> attachImage() async {
      var picker = ImagePicker();
      var pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = pickedFile;
        });
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          attachImage();
        },
        child: imageFile != null
            ? CircleAvatar(
                radius: 100,
                backgroundColor: kAccent,
                backgroundImage: FileImage(
                  File(imageFile.path),
                ),
              )
            : CircleAvatar(
                radius: 80,
                backgroundColor: kAccent,
                backgroundImage: NetworkImage(
                  widget.gaugeRecordsModel != null
                      ? widget.gaugeRecordsModel!.imagepath
                      : "",
                ),
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
          if (imageFile != null) {
            //Navigator.popAndPushNamed(context, HomeActivity.id);
            var data = GaugeRecordsModel(
              id: widget.gaugeRecordsModel != null
                  ? widget.gaugeRecordsModel!.id
                  : 0,
              uploaderId: (await _sharedPreferenceProvider.getIntValue(
                getEnumValue(UserDetails.userId),
              )),
              gpsLocation: gpsLocationController.text,
              waterlevel: waterLevelController.text.toString(),
              temperature: temperatureController.text.toString(),
              riverFlow: riverFlowController.text.toString(),
              gaugeId: int.parse(guageIdController.text),
              approval: widget.gaugeRecordsModel != null
                  ? widget.gaugeRecordsModel!.approval
                  : null,
              approverId: widget.gaugeRecordsModel != null
                  ? widget.gaugeRecordsModel!.approverId
                  : null,
              timestamp: null,
              uploaderModel: null,
              approverModel: null,
              gaugeStationModel: null,
            );
            var response = await _gaugeRecordsProvider.gaugeRecordsUpload(
              modelData: data,
              file: imageFile,
              shouldUpdate: widget.update,
            );
            loggerAccent(message: response.toJson().toString());
            Navigator.of(context).pop();
            endScreen();
          } else {
            Navigator.of(context).pop();
            final snackBar = SnackBar(content: Text('Please select image'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      );

  void endScreen() {
    final snackBar = SnackBar(content: Text('Record Updated!'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.of(context).pop();
  }
}
