
import 'package:flutter/cupertino.dart';

class Controller extends ChangeNotifier{

  bool isThemeWhite = true;
  void updateTheme(){
    isThemeWhite = !isThemeWhite;
    notifyListeners();
  }

}
