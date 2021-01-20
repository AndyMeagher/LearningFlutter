import 'package:flutter/foundation.dart';

//All State Related Logic Lives here
class CaseViewModel extends ChangeNotifier {
   var isFiltering = true;

   void toggleFilter(){
     isFiltering = !isFiltering;
     notifyListeners();
   }

}