import 'package:flutter/material.dart';

class ChangeLangProvider extends ChangeNotifier {
  String currentLang = 'en';

  void changeLang(String newLang) {
    if (currentLang == newLang) {
      return;
    }
    currentLang = newLang;
    notifyListeners();
  }
}
