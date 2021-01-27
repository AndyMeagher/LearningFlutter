import 'package:LearningFlutter/home_view.dart';
import 'package:LearningFlutter/settings_view.dart';
import 'package:flutter/material.dart';

import 'cases_view.dart';

class MainTabController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainTabControllerState();
  }
}

class _MainTabControllerState extends State<MainTabController> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeView(),
    CasesView(),
    PlaceholderWidget(Colors.deepOrange),
    SettingsView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Colors.green,// this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.create_new_folder),
            label: 'Cases',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.description),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Settings'
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}