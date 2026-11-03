import 'package:flutter/material.dart';

import 'scaffold/compact_scaffold.dart';
import 'scaffold/device.dart';
import 'scaffold/extended_scaffold.dart';
import 'ui/assets.dart';
import 'ui/layout/layout_model.dart';
import 'ui/scroller.dart';
import 'ui/strings/strings_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StringsModel.instance.setLanguage(
    WidgetsBinding.instance.platformDispatcher.locale.languageCode
  );
  await AppAssets.loadStartupAssets();
  runApp(_MyApp());
}

class _MyApp extends ListenableBuilder {
  _MyApp() : super(
    listenable: StringsModel.instance,
    builder: (_, __) {
      return MaterialApp(
        title: StringsModel.strings.appName,
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,

        home: ListenableBuilder(
          listenable: LayoutModel.instance,
          builder: (BuildContext context, Widget? child) {
            return Material(
              color: context.appLayout.theme.background.baseColor,
              child: context.isExtendedScreen
                ? ExtendedScaffold()
                : CompactScaffold()
            );
          }
        )
      );
    }
  );
}