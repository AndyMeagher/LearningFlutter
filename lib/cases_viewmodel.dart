import 'package:flutter/foundation.dart';

import 'web_api.dart';
import 'case.dart';

//All State Related Logic Lives here
class CaseViewModel extends ChangeNotifier {

  WebApi _webApi = serviceLocator<WebApi>(); //  <-- service
  List<Case> cases = List<Case>();

  void getCases() async {
    this.cases = await _webApi.getCases();
    notifyListeners();
  }

}