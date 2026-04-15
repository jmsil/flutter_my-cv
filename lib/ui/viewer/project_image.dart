import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../container/container.dart';
import '../theme.dart';

class ProjectImageWidget extends AppContainer {
  ProjectImageWidget(Uint8List image)
    : super(
        color: Colors.white,
        padding: const ThemedEdgeInsets.normal(),
        borderColor: AppTheme.lightBlue.withValues(alpha: 0.32),
        borderRadius: AppTheme.allBorderRadius,
        child: Image.memory(image)
      );
}