

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'case.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.getCases(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.grey[100],
        body: CustomScrollView(slivers: [
          SliverList(
              delegate:
              new SliverChildListDelegate(_buildList(context, model)))
        ]),
      ),
    );
  }

  Widget _buildTitleView(BuildContext context, HomeViewModel model) {
    return new Container(
        margin: new EdgeInsets.only( top: 40, bottom: 40),
        child: new Column(children: [
          new Padding(
              padding: new EdgeInsets.all(16.0),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Home",
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Container(
                        height: 35,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.black12,
                              offset: new Offset(0.0, 0),
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                        child: FlatButton(
                            onPressed: () {},
                            child: Row(children: [
                              Text('Add Case',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              new IconTheme(
                                data: new IconThemeData(color: Colors.green),
                                child: new Icon(Icons.add),
                              )
                            ]))),
                  ])),
          SizedBox(height: 30),
          new Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            _buildTopCard(CaseStatus.alert, 3),
            _buildTopCard(CaseStatus.progress, 2),
            _buildTopCard(CaseStatus.approved, 1),
            _buildTopCard(CaseStatus.shipped, 4)
          ])
        ]));
  }

  Widget _buildCardView(Case caseObj) {
    return new Container(
        margin: new EdgeInsets.only(left:8.0, right: 8.0, top:8.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: new Offset(0.0, 0),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Padding(
            padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(width: 3.0, color: caseObj.status.color))),
                child: ListTile(
                  title: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              ClipOval(
                                child: Material(
                                  child: SizedBox(
                                      child: IconTheme(
                                        data: new IconThemeData(color: caseObj.status.color),
                                        child: new Icon( caseObj.status.icon),
                                      )),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(caseObj.status.description,
                                  style: TextStyle(
                                      color:  caseObj.status.color,
                                      fontWeight: FontWeight.bold))
                            ]),
                            Text('20APTO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey))
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Patient Name',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Hospital Name',
                                style: TextStyle(color: Colors.grey))
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Patient: MP',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('DOB: 22MAR76'),
                            Text('Sx:30JAN21')
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('L1, L2, L3, L4, L5',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("View Plan",
                                style: TextStyle(color: Colors.blue))
                          ])
                    ],
                  ),
                ))));
  }

  Widget _buildSectionHeader(HomeViewModel model) {
    return new Padding(
        padding: new EdgeInsets.only(left: 16.0, bottom: 12.0, top: 12.0),
        child: new Text("Next Surgeries (${model.cases.length.toString()})",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey)));
  }

  Widget _buildTopCard(CaseStatus status, int number){
    return new Expanded(
        child: new Container(
            padding: new EdgeInsets.only(bottom: 10, top: 20, left: 5, right: 5),
            margin: new EdgeInsets.all(5),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                new BoxShadow(
                  color: Colors.black12,
                  offset: new Offset(0.0, 0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Center(
                child: Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                          top: -30,
                          child: ClipOval(
                            child: Material(
                              child: SizedBox(
                                  child: IconTheme(
                                    data: new IconThemeData(color: status.color),
                                    child: new Icon(status.icon),
                                  )),
                            ),
                          )),
                      InkWell(
                        splashColor: status.color.withAlpha(30),
                        onTap: () {
                          print('Card tapped.');
                        },
                        child: Column(
                          children: [
                            Text(status.name,
                                style: TextStyle(color: status.color)),
                            Text(number.toString(),
                                style: TextStyle(
                                    fontSize: 24, color: status.color))
                          ],
                        ),
                      )
                    ]))));
  }

  List _buildList(BuildContext context, HomeViewModel model) {
    List<Widget> listItems = List();
    for (int i = -2; i < model.cases.length; i++) {
      if (i == -2) {
        listItems.add(_buildTitleView(context, model));
      } else if (i == -1) {
        listItems.add(_buildSectionHeader(model));
      } else {
        listItems.add(_buildCardView(model.cases[i]));
      }
    }

    return listItems;
  }
}