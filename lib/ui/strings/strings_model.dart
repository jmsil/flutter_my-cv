import 'package:flutter/foundation.dart';

import 'strings.dart';
import 'strings_en.dart';
import 'strings_pt.dart';

export 'strings.dart';

class StringsModel extends ChangeNotifier {
  static final StringsModel instance = StringsModel._();

  String _languageCode = '';
  late Strings _strings;

  StringsModel._();

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