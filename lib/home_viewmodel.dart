import 'package:LearningFlutter/web_api.dart';
import 'package:flutter/foundation.dart';

import 'case.dart';

class HomeViewModel extends ChangeNotifier{
  WebApi _webApi = serviceLocator<WebApi>(); //  <-- service
  List<Case> cases = List<Case>();

  void getCases() async {
    this.cases = await _webApi.getCases();
    notifyListeners();
  }
}