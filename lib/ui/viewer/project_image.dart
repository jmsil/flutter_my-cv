import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../container/container.dart';
import '../layout/edge_insets.dart';
import '../layout/layout_provider.dart';
import '../theme.dart';

class ProjectImageWidget extends AppContainer {
  ProjectImageWidget(Uint8List image)
    : super(
        color: Colors.white,
        padding: const AppEdgeInsets.normal(),
        borderColor: AppTheme.lightBlue.withValues(alpha: 0.32),
        borderRadius: LayoutProvider.theme.allBorderRadius,
        child: Image.memory(image)
      );
}