import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../container/container.dart';
import '../layout/edge_insets.dart';
import '../layout/layout_provider.dart';
import 'full_window_handler.dart';

class ProjectImageWidget extends StatelessWidget {
  final Uint8List image;

  ProjectImageWidget(this.image);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    final builtImageWidget = Image.memory(image);

    final Widget builtFullWindowChild = _FullWindowHandler(
      theme,
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
      theme,
      builtImageWidget,
      builtFullWindowChild
    );
  }
}

class _FullWindowHandler extends AppViewerFullWindowHandler {
  _FullWindowHandler(AppTheme theme, Widget child, Widget? fullWindowChild)
    : super(
        iconColor: theme.overBackgroundColor2,
        child: AppContainer(
          color: theme.overBackgroundColor3,
          padding: const AppEdgeInsets.normal(),
          borderColor: theme.overBackgroundColor2.withValues(alpha: 0.16),
          borderRadius: AppTheme.allBorderRadius,
          child: child
        ),
        fullWindowChild: fullWindowChild
      );
}