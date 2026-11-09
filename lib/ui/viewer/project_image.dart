import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../container.dart';
import '../layout/dimens.dart';
import '../layout/layout_theme_model.dart';
import 'full_window_handler.dart';

class ProjectImageWidget extends StatelessWidget {
  final Uint8List image;

  ProjectImageWidget(this.image);

  @override
  Widget build(BuildContext context) {
    final AppThemeData themeData = LayoutThemeModel.theme.viewer;
    final builtImageWidget = Image.memory(image);

    final Widget builtFullWindowChild = _FullWindowHandler(
      themeData,
      LayoutBuilder(
        builder: (BuildContext builderContext, BoxConstraints builderConstraints) {
          return InteractiveViewer(
            minScale: 0.01,
            maxScale: 1,
            constrained: false,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: max(builderConstraints.maxWidth, 1920),
                minHeight: builderConstraints.maxHeight
              ),
              child: builtImageWidget
            )
          );
        }
      ),
      null
    );

    return _FullWindowHandler(
      themeData,
      builtImageWidget,
      builtFullWindowChild
    );
  }
}

class _FullWindowHandler extends AppViewerFullWindowHandler {
  _FullWindowHandler(
    AppThemeData themeData, Widget child, Widget? fullWindowChild
  ) : super(
    iconColor: themeData.decoration1.color,
    child: AppContainer(
      color: Colors.white,
      padding: const AppEdgeInsets.normal(),
      borderColor: themeData.decoration1.color.withDecorationAlpha,
      borderRadius: AppTheme.allBorderRadius,
      child: child
    ),
    fullWindowChild: fullWindowChild
  );
}