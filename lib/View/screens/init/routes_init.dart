import 'package:flutter/material.dart';
import 'package:flutter_project/Provider/GaugeRecordsProvider.dart';
import 'package:flutter_project/Provider/GuageStationProvider.dart';
import 'package:flutter_project/Provider/NewsProvider.dart';
import 'package:flutter_project/Provider/SharedPreferenceProvider.dart';
import 'package:flutter_project/Provider/StaffProvider.dart';
import 'package:flutter_project/Provider/StationStatisticsProvider.dart';
import 'package:flutter_project/Provider/StationsProvider.dart';
import 'package:flutter_project/Provider/UsersProvider.dart';
import 'package:flutter_project/Provider/rolesProvider.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/screens/activities/RegistrationActivity.dart';
import 'package:flutter_project/View/screens/activities/home_activity.dart';
import 'package:flutter_project/View/screens/activities/login_activity.dart';
import 'package:flutter_project/View/screens/activities/stationRecords.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';
import 'package:provider/provider.dart';

class RoutesInit extends StatefulWidget {
  const RoutesInit({Key? key}) : super(key: key);

  @override
  State<RoutesInit> createState() => _RoutesInitState();
}

class _RoutesInitState extends State<RoutesInit> {
  bool isLoading = true, isSigned = false;
  SharedPreferenceProvider _sharedPreferenceProvider =
      SharedPreferenceProvider();

  @override
  void initState() {
    checkIfSigned();
    super.initState();
  }

  Future<void> checkIfSigned() async {
    var signedState = await _sharedPreferenceProvider.isLoggedIn();
    setState(() {
      isSigned = signedState;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (BuildContext context) => GaugeRecordsProvider(),
              ),
              ChangeNotifierProvider(
                create: (BuildContext context) => GaugeStationProvider(),
              ),
              ChangeNotifierProvider(
                create: (BuildContext context) => NewsProvider(),
              ),
              ChangeNotifierProvider(
                create: (BuildContext context) => RolesProvider(),
              ),
              ChangeNotifierProvider(
                create: (BuildContext context) => StaffProvider(),
              ),
              ChangeNotifierProvider(
                create: (BuildContext context) => StationsProvider(),
              ),
              ChangeNotifierProvider(
                create: (BuildContext context) => StationStatisticsProvider(),
              ),
              ChangeNotifierProvider(
                create: (BuildContext context) => UsersProvider(),
              ),
            ],
            child: MaterialApp(
              title: 'Hydro App',
              theme: ThemeData(
                brightness: Brightness.dark,
                primaryColor: kAccent,
                accentColor: kAccent,
                scaffoldBackgroundColor: Colors.black,
                //buttons
                buttonTheme: ButtonThemeData(
                  buttonColor: kAccent,
                  textTheme: ButtonTextTheme.primary,
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      kAccent,
                    ), //button color
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Color(0xffffffff),
                    ), //text (and icon)
                  ),
                ),
                //text
                fontFamily: 'roboto',
                textTheme: TextTheme(
                  headline1:
                      TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
                  headline6:
                      TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
                  bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'roboto'),
                ),
              ),
              //banner
              debugShowCheckedModeBanner: false,
              //routes
              initialRoute: isSigned ? HomeActivity.id : LoginActivity.id,
              routes: {
                HomeActivity.id: (context) => HomeActivity(),
                LoginActivity.id: (context) => LoginActivity(),
                RegistrationActivity.id: (context) => RegistrationActivity(),
              },
            ),
          );
  }
}
