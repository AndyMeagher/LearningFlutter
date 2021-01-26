import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'cases_viewmodel.dart';

class CasesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CaseViewModel>.reactive(
      viewModelBuilder: () => CaseViewModel(),

      ///onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.grey[100],
        body: CustomScrollView(slivers: [
          SliverList(
              delegate:
                  new SliverChildListDelegate(_buildList(context, model, 50)))
        ]),
      ),
    );
  }

  Widget _buildTitleView(BuildContext context, CaseViewModel model) {
    return new Padding(
        padding: new EdgeInsets.only(right: 16, left: 16, top: 50),
        child: new Column(children: [
          new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Home", style: TextStyle(fontSize: 20)),
                RaisedButton(
                    onPressed: () {},
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(children: [
                      Text('Add Case'),
                      new IconTheme(
                        data: new IconThemeData(color: Colors.green),
                        child: new Icon(Icons.add),
                      )
                    ])),
              ]),
          new Padding(
            padding: new EdgeInsets.only(top: 25, bottom: 25),
            child:
                new Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              new Expanded(
                  child: new Card(
                      child: Padding(
                padding: new EdgeInsets.only(bottom: 10, top: 20),
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
                                data: new IconThemeData(color: Colors.red),
                                child: new Icon(Icons.error),
                              )),
                            ),
                          )),
                      InkWell(
                        splashColor: Colors.red.withAlpha(30),
                        onTap: () {
                          print('Card tapped.');
                        },
                        child: Column(
                          children: [
                            Text('Alerts', style: TextStyle(color: Colors.red)),
                            Text('3',
                                style:
                                    TextStyle(fontSize: 24, color: Colors.red))
                          ],
                        ),
                      )
                    ])),
              ))),
              new Expanded(
                  child: new Card(
                      child: Padding(
                          padding: new EdgeInsets.only(bottom: 10, top: 20),
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
                                            data: new IconThemeData(
                                                color: Colors.indigo),
                                            child: new Icon(Icons.pie_chart),
                                          )),
                                        ),
                                      )),
                                  InkWell(
                                    splashColor: Colors.indigo.withAlpha(30),
                                    onTap: () {
                                      print('Card tapped.');
                                    },
                                    child: Column(
                                      children: [
                                        Text('In Progress',
                                            style: TextStyle(
                                                color: Colors.indigo)),
                                        Text('2',
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.indigo))
                                      ],
                                    ),
                                  )
                                ]),
                          )))),
              new Expanded(
                  child: new Card(
                      child: Padding(
                          padding: new EdgeInsets.only(bottom: 10, top: 20),
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
                                            data: new IconThemeData(
                                                color: Colors.green),
                                            child: new Icon(Icons.check_circle),
                                          )),
                                        ),
                                      )),
                                  InkWell(
                                    splashColor: Colors.green.withAlpha(30),
                                    onTap: () {
                                      print('Card tapped.');
                                    },
                                    child: Column(
                                      children: [
                                        Text('Approved',
                                            style:
                                                TextStyle(color: Colors.green)),
                                        Text('1',
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.green))
                                      ],
                                    ),
                                  )
                                ]),
                          )))),
              new Expanded(
                  child: new Card(
                      child: Padding(
                          padding: new EdgeInsets.only(bottom: 10, top: 20),
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
                                            data: new IconThemeData(
                                                color: Colors.indigo),
                                            child:
                                                new Icon(Icons.local_shipping),
                                          )),
                                        ),
                                      )),
                                  InkWell(
                                    splashColor: Colors.indigo.withAlpha(30),
                                    onTap: () {
                                      print('Card tapped.');
                                    },
                                    child: Column(
                                      children: [
                                        Text('Shipped',
                                            style: TextStyle(
                                                color: Colors.indigo)),
                                        Text('4',
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.indigo))
                                      ],
                                    ),
                                  )
                                ]),
                          ))))
            ]),
          )
        ]));
  }

  Widget _buildCardView(int index) {
    return new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new Card(
          child: Padding( padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Container(decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(width: 4.0, color: Colors.red))),
              child: ListTile(
                title: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [ClipOval(
                                child: Material(
                                  child: SizedBox(
                                      child: IconTheme(
                                        data: new IconThemeData(
                                            color: Colors.red),
                                        child:
                                        new Icon(Icons.error),
                                      )),
                                ),
                              ),
                                Text('Missing Information', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))]),
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
                              Text(
                                  "View Plan",
                                  style: TextStyle(color: Colors.blue)
                              )
                            ])
                      ],
                    ),
              ))


        )));
  }

  Widget _buildSectionHeader() {
    return new Padding(
        padding: new EdgeInsets.only(left: 16.0, bottom: 12.0, top: 12.0),
        child: new Text("Next Surgeries (3)",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey)));
  }

  List _buildList(BuildContext context, CaseViewModel model, int count) {
    List<Widget> listItems = List();
    for (int i = -2; i < count; i++) {
      if (i == -2) {
        listItems.add(_buildTitleView(context, model));
      } else if (i == -1) {
        listItems.add(_buildSectionHeader());
      } else {
        listItems.add(_buildCardView(i));
      }
    }

    return listItems;
  }
}
