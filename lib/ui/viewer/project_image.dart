import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../container/container.dart';
import '../theme.dart';

class ProjectImageWidget extends AppContainer {
  ProjectImageWidget(Uint8List image, bool hasTopMargin, bool hasBottomMargin)
    : super(
        color: Colors.white,
        padding: const ThemedEdgeInsets.normal(),
        margin: EdgeInsets.only(
          top: hasTopMargin ? AppTheme.normalSpacingValue : 0,
          bottom: hasBottomMargin ? AppTheme.xLargeSpacingValue : 0
        ),
        borderColor: AppTheme.lightBlue.withValues(alpha: 0.32),
        borderRadius: AppTheme.allBorderRadius,
        child: Image.memory(image)
      );
}