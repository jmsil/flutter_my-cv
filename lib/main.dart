import 'package:flutter/material.dart';

import 'scaffold/scaffold.dart';
import 'ui/assets.dart';
import 'ui/scroller.dart';
import 'ui/strings/strings_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppAssets.loadStartupAssets();
  runApp(
    ListenableBuilder(
      listenable: StringsModel.instance,
      builder: (_, __) {
        return MaterialApp(
          title: StringsModel.strings.appName,
          scrollBehavior: AppScrollBehavior(),
          home: AppScaffold(),
          debugShowCheckedModeBanner: false
        );
      }
    )
  );
}