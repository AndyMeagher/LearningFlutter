import 'package:flutter/foundation.dart';

import 'web_api.dart';

class LoginViewModel extends ChangeNotifier {

  WebApi _webApi = serviceLocator<WebApi>(); //  <-- service

  Future<bool> logUserIn(String email, String pw) async { //
    return await _webApi.login(email, pw);
  }

}
