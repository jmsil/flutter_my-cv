import 'package:flutter/material.dart';

import 'scaffold/main_scaffold.dart';
import 'ui/assets.dart';
import 'ui/scroller.dart';
import 'ui/strings/strings_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StringsModel.instance.setLanguage(
    WidgetsBinding.instance.platformDispatcher.locale.languageCode
  );
  await AppAssets.loadStartupAssets();

  runApp(
    ListenableBuilder(
      listenable: StringsModel.instance,
      builder: (builderContext, builderChild) {
        return MaterialApp(
          title: StringsModel.strings.appName,
          scrollBehavior: AppScrollBehavior(),
          home: MainScaffold(),
          debugShowCheckedModeBanner: false
        );
      }
    )
  );
}