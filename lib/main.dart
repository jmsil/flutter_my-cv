import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_cv/ui/strings.dart';

import 'scaffold/main_scaffold.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppStrings.setLanguage(WidgetsBinding.instance.platformDispatcher.locale.languageCode);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );
  runApp(MainScaffold());
}