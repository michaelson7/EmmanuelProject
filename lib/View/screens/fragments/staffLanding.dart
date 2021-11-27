import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_project/Model/core/GaugeRecordsModel.dart';
import 'package:flutter_project/Model/core/GaugeStationModel.dart';
import 'package:flutter_project/Provider/GaugeRecordsProvider.dart';
import 'package:flutter_project/Provider/SharedPreferenceProvider.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/constants/enums.dart';
import 'package:flutter_project/View/widgets/horizontalWidgetBuilder.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';
import 'package:intl/intl.dart';

class StaffLanding extends StatefulWidget {
  static String id = "StaffLanding";
  const StaffLanding({Key? key}) : super(key: key);

  @override
  _StaffLandingState createState() => _StaffLandingState();
}

class _StaffLandingState extends State<StaffLanding> {
  bool isLoading = false;
  SharedPreferenceProvider _sharedPreferenceProvider =
      SharedPreferenceProvider();
  GaugeRecordsProvider _gaugeRecordsProvider = GaugeRecordsProvider();

  getData() async {
    var stationID = await _sharedPreferenceProvider.getStringValue(
      getEnumValue(UserStation.stationID),
    );
    if (stationID != null) {
      _gaugeRecordsProvider.getGaugeRecords(int.parse(stationID));
    }

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Summary')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: StreamBuilder(
              stream: _gaugeRecordsProvider.GaugeRecordsListController,
              builder: (
                context,
                AsyncSnapshot<List<GaugeRecordsModel>> snapshot,
              ) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header(),
                      SizedBox(height: 15),
                      descriptionCard(data!),
                      SizedBox(height: 15),
                      SizedBox(height: 15),
                      dailyCard(data),
                      SizedBox(height: 15),
                      closeCard()
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }

  header() {
    return Center(
      child: Text(
        'Station Summary',
        style: kTextStyleHeader1,
      ),
    );
  }

  descriptionCard(List<GaugeRecordsModel> data) {
    Padding statCards(GaugeRecordsModel data) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                DateFormat('Hm').format(data.normalTime).toString(),
                style: kTextStyleHint,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(WeatherIcons.wi_day_cloudy),
              ),
              Text('${data.temperature}°'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${data.riverFlow} m³s',
                  style: kTextStyleHint,
                ),
              )
            ],
          ),
        ),
      );
    }

    horizontalCardBuilder2({
      required BuildContext context,
    }) {
      List<Widget> widgetList = [];
      for (var i = 0; i < 4; i++) {
        var interface = statCards(data[i]);
        widgetList.add(interface);
      }
      var horizontalStyle = horizontalWidgetBuilder(widgetList);
      return horizontalStyle;
    }

    return Material(
      color: kCardBackground,
      borderRadius: kBorderRadiusCircular,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.add_location),
                        SizedBox(width: 10),
                        Text(data[0].gaugeStationModel!.stationsModel!.title),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      DateFormat.yMMMd().format(DateTime.now()),
                      style: kTextStyleHint,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(WeatherIcons.wi_cloud, size: 50),
                            SizedBox(width: 20),
                            Text(
                              '24°',
                              textScaleFactor: 2,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Cloudy', style: kTextStyleHint),
                            Text('27° / 18°', style: kTextStyleHint),
                            Text('Feels Like 24°', style: kTextStyleHint),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(child: horizontalCardBuilder2(context: context)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dailyCard(List<GaugeRecordsModel> data) {
    return Material(
      color: kCardBackground,
      borderRadius: kBorderRadiusCircular,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Records', style: kTextStyleHint),
                        SizedBox(width: 10),
                        Text('', style: kTextStyleHint),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.length > 7 ? 7 : 0,
                      itemBuilder: (BuildContext context, int index) {
                        var dataValue = data[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(DateFormat('EEEE')
                                  .format(dataValue.normalTime)
                                  .toString()),
                              Row(
                                children: [
                                  Icon(
                                    WeatherIcons.wi_barometer,
                                    size: 15,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    dataValue.waterlevel.toString(),
                                    style: kTextStyleHint,
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    WeatherIcons.wi_thermometer,
                                    size: 15,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '${dataValue.temperature}°',
                                    style: kTextStyleHint,
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    WeatherIcons.wi_strong_wind,
                                    size: 15,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '${dataValue.riverFlow} m³s',
                                    style: kTextStyleHint,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  closeCard() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('CLOSE'),
      ),
    );
  }
}
