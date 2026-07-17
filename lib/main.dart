import 'package:flutter/material.dart';

import 'scaffold/main_scaffold.dart';
import 'ui/assets.dart';
import 'ui/scroller.dart';
import 'ui/strings/strings_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StringsProvider.instance.setLanguage(
    WidgetsBinding.instance.platformDispatcher.locale.languageCode
  );
  await AppAssets.loadStartupAssets();

  runApp(
    ListenableBuilder(
      listenable: StringsProvider.instance,
      builder: (builderContext, builderChild) {
        return MaterialApp(
          title: StringsProvider.strings.appName,
          scrollBehavior: AppScrollBehavior(),
          home: MainScaffold(),
          debugShowCheckedModeBanner: false
        );
      }
    )
  );
}