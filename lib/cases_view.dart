import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'cases_viewmodel.dart';

class CasesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<CaseViewModel>.reactive(
      viewModelBuilder: () => CaseViewModel(),

      ///onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
            leading: FlatButton(child: Icon(Icons.filter_list)),
            title: Text('Cases'),

            actions: [
              FlatButton(
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Add'),
                      Icon(Icons.add),
                    ]),
              )
            ],
            elevation: 0.0),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(child: Text("Cases")),
        ),
      ),
    );
  }
}
