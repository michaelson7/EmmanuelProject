import 'package:flutter/material.dart';
import 'package:flutter_project/Provider/account_provider.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/screens/activities/home_activity.dart';
import 'package:flutter_project/View/screens/activities/login_activity.dart';
import 'package:flutter_project/View/screens/activities/stationRecords.dart';
import 'package:provider/provider.dart';

class RoutesInit extends StatelessWidget {
  const RoutesInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => AccountProvider(),
        ),
      ],
      child: MaterialApp(
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
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'roboto'),
          ),
        ),
        //banner
        debugShowCheckedModeBanner: false,
        //routes
        initialRoute: HomeActivity.id,
        routes: {
          HomeActivity.id: (context) => HomeActivity(),
          LoginActivity.id: (context) => LoginActivity(),
        },
      ),
    );
  }
}
