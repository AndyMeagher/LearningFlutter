import 'package:flutter/material.dart';

import 'cases_view.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.deepOrange),
    CasesView(),
    PlaceholderWidget(Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,// this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.description),
            label: 'Cases',
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