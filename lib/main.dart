import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarBrightness: Brightness.light)/* set Status bar icon color in iOS. */
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
          accentIconTheme: Theme.of(context).accentIconTheme.copyWith(
              color: Colors.black
          ),
          accentColor: Colors.amber,
          primaryColor: Colors.blue,
          primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
              color: Colors.black
          ),
          primaryTextTheme: Theme
              .of(context)
              .primaryTextTheme
              .apply(bodyColor: Colors.black)),
      home: LoginView()
    );
  }
}
