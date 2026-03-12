import 'package:flutter/material.dart';

import 'scaffold/main_scaffold.dart';
import 'ui/assets.dart';
import 'ui/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppStrings.setLanguage(
    WidgetsBinding.instance.platformDispatcher.locale.languageCode
  );
  await AppAssets.loadStartupAssets();

  runApp(MainScaffold());
}