import 'package:flutter/foundation.dart';

import 'strings.dart';
import 'strings_en.dart';
import 'strings_pt.dart';

class StringsProvider extends ChangeNotifier {
  static final StringsProvider instance = StringsProvider._();

  String _languageCode = 'en';
  Strings _strings = StringsEn();

  StringsProvider._();

  void setLanguage(String languageCode) {
    if (languageCode != _languageCode) {
      _languageCode = languageCode;
      _strings = languageCode == 'pt' ? StringsPt() : StringsEn();
      notifyListeners();
    }
  }

  static String get languageCode => instance._languageCode;
  static Strings get strings => instance._strings;
}