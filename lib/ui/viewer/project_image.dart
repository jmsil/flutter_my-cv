import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../container/container.dart';
import '../layout/edge_insets.dart';
import '../layout/theme.dart';

class ProjectImageWidget extends AppContainer {
  ProjectImageWidget(AppTheme theme, Uint8List image)
    : super(
        color: theme.overBackgroundColor3,
        padding: const AppEdgeInsets.normal(),
        borderColor: theme.overBackgroundColor2.withValues(alpha: 0.12),
        borderRadius: AppTheme.allBorderRadius,
        child: Image.memory(image)
      );
}