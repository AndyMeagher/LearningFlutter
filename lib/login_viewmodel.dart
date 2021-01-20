import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {

  WebApi _webApi = serviceLocator<WebApi>(); //  <-- service

  Future<bool> logUserIn(String email, String pw) async { //
    return await _webApi.login(email, pw);
  }

}

// Fake service locator. Use GetIt in a real app.
// Or inject the service in the view model constructor.
WebApi serviceLocator<T>() {
  return WebApi();
}

// Fake web api
class WebApi {
  Future<bool> login(String email, String pw) => Future.delayed(Duration(seconds: 1), () => true);
}