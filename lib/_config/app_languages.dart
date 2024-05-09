import 'package:flutter/material.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = const Locale('en');
  Locale get appLocal => _appLocale;
  fetchLocale() async {
    _appLocale = const Locale('en');
    return Null;
  }

  String get lang {
    return _appLocale.languageCode;
  }

  void changeLanguage(Locale type) async {
    if (_appLocale == type) {
      return;
    }
    if (type == const Locale("sr")) {
      _appLocale = const Locale("sr");
    } else if (type == const Locale("en")) {
      _appLocale = const Locale("en");
    } else if (type == const Locale("fr")) {
      _appLocale = const Locale("fr");
    }
    notifyListeners();
  }
}
