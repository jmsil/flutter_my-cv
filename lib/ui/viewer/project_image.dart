import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../container/container.dart';
import '../layout/edge_insets.dart';
import '../theme.dart' as OldTheme;
import '../theme/theme.dart';

class ProjectImageWidget extends AppContainer {
  ProjectImageWidget(Uint8List image)
    : super(
        color: Colors.white,
        padding: const AppEdgeInsets.normal(),
        borderColor: OldTheme.AppTheme.lightBlue.withValues(alpha: 0.32),
        borderRadius: AppTheme.allBorderRadius,
        child: Image.memory(image)
      );
}