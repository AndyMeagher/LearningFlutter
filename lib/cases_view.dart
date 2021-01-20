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
              delegate: new SliverChildListDelegate(_buildList(model, 50)))
        ]),
      ),
    );
  }
  
  Widget _buildTitleView(CaseViewModel model){
    return new Padding(
        padding: new EdgeInsets.only(right: 16, left: 16, top: 40),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipOval(
                child: Material(
                  color: model.isFiltering
                      ? Colors.black
                      : Colors.white, // button color
                  child: InkWell(
                    child: SizedBox(
                        width: 40,
                        height: 40,
                        child: IconTheme(
                          data: new IconThemeData(
                              color: model.isFiltering
                                  ? Colors.white
                                  : Colors.black),
                          child: new Icon(Icons.filter_list),
                        )),
                    onTap: () {
                      model.toggleFilter();
                    },
                  ),
                ),
              ),
              Text("Cases", style: TextStyle(fontSize: 20)),
              RaisedButton(
                  onPressed: () {},
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(children: [
                    Text('Add'),
                    new IconTheme(
                      data: new IconThemeData(color: Colors.green),
                      child: new Icon(Icons.add),
                    )
                  ])),
            ]));
  }

  Widget _buildCardView(int index){
    return new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Item ${index.toString()}'),
            subtitle: Text('Here is a second line'),
            trailing: Icon(Icons.more_vert),
          ),
        ));
  }

  List _buildList(CaseViewModel model, int count) {
    List<Widget> listItems = List();
    for (int i = -1; i < count; i++) {
      if (i == -1) {
        listItems.add(_buildTitleView(model));
      } else {
        listItems.add(_buildCardView(i));
      }
    }

    return listItems;
  }
}
