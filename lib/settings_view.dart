import 'package:LearningFlutter/login_view.dart';
import 'package:LearningFlutter/settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),

      ///onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.grey[100],
          body: Center(
              child: RaisedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) =>
                            LoginView()));
                  },
                  label: Text("Log Out"),
                  icon: Icon(Icons.logout)))),
    );
  }
}
