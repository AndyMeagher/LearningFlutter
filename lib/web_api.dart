// Fake service locator. Use GetIt in a real app.
// Or inject the service in the view model constructor.
import 'case.dart';

WebApi serviceLocator<T>() {
  return WebApi();
}

// Fake web api
class WebApi {
  Future<bool> login(String email, String pw) => Future.delayed(Duration(seconds: 1), () => true);
  Future<List<Case>> getCases() => Future.delayed(Duration(seconds: 1), () =>
    [Case(CaseStatus.alert), Case(CaseStatus.progress), Case(CaseStatus.progress), Case(CaseStatus.shipped)]
  );
}