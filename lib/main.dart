import 'package:flutter/material.dart';

import 'scaffold/main_scaffold.dart';
import 'ui/assets.dart';
import 'ui/scroller.dart';
import 'ui/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppStrings.instance.setLanguage(
    WidgetsBinding.instance.platformDispatcher.locale.languageCode
  );
  await AppAssets.loadStartupAssets();

  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppStrings.instance,
      builder: (builderContext, builderChild) {
        return MaterialApp(
          title: AppStrings.appName,
          scrollBehavior: AppScrollBehavior(),
          home: MainScaffold(),
          debugShowCheckedModeBanner: false
        );
      }
    );
  }
}