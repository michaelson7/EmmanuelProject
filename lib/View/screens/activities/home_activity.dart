import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_project/Provider/SharedPreferenceProvider.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/screens/activities/login_activity.dart';
import 'package:flutter_project/View/screens/fragments/NewsFragment.dart';
import 'package:flutter_project/View/screens/fragments/historicalData.dart';
import 'package:flutter_project/View/screens/fragments/home_fragment.dart';
import 'package:flutter_project/View/screens/fragments/map_fragment.dart';
import 'package:flutter_project/View/screens/fragments/profileFragment.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';

class HomeActivity extends StatefulWidget {
  static String id = "HomeActivity";
  const HomeActivity({Key? key}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  List<Widget> fragments = [
    HomeFragment(),
    MapFragment(),
    HistoricalDataFragment(),
    NewsFragment(),
    ProfileFragment(),
  ];

  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  SharedPreferenceProvider _sharedPreferenceProvider =
      SharedPreferenceProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text('Hydro App'),
              floating: true,
              snap: true,
              actions: [
                InkWell(
                  child: IconButton(
                    onPressed: () {
                      logOut();
                    },
                    icon: Icon(Icons.logout),
                  ),
                ),
              ],
            ),
          ];
        },
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: fragments,
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: kCardBackground,
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.home, size: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.map, size: 24),
              label: 'Map ',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.history, size: 24),
              label: 'Historical Data',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.newspaper_o, size: 24),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.user, size: 24),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kAccent,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  logOut() async {
    await _sharedPreferenceProvider.logOut();
    Navigator.popAndPushNamed(context, LoginActivity.id);
  }
}
