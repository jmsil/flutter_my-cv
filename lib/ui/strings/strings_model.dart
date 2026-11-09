import 'package:flutter/widgets.dart';

import 'strings.dart';
import 'strings_en.dart';
import 'strings_pt.dart';

export 'strings.dart';

class StringsModel extends ChangeNotifier {
  static final StringsModel instance = StringsModel._fac();

  String _languageCode;
  Strings _strings;

  StringsModel._(
    this._languageCode
  ) :
    this._strings = _getStrings(_languageCode);

  factory StringsModel._fac() {
    return StringsModel._(
      WidgetsBinding.instance.platformDispatcher.locale.languageCode
    );
  }

  void setLanguage(String languageCode) {
    if (languageCode != _languageCode) {
      _languageCode = languageCode;
      _strings = _getStrings(languageCode);
      notifyListeners();
    }
  }

  static Strings _getStrings(String languageCode) {
    return languageCode == 'pt' ? StringsPt() : StringsEn();
  }

  static String get languageCode => instance._languageCode;
  static Strings get strings => instance._strings;
}