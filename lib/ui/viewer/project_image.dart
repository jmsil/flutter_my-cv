import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../container/container.dart';
import '../theme.dart';

class ProjectImageWidget extends AppContainer {
  ProjectImageWidget(Uint8List imageData, {required hasTopMargin})
    : super(
        color: Colors.white,
        padding: const ThemedEdgeInsets.normal(),
        margin: EdgeInsets.only(
          top: hasTopMargin ? AppTheme.xLargeSpacingValue : 0,
          bottom: AppTheme.xLargeSpacingValue
        ),
        borderColor: AppTheme.lightBlue.withValues(alpha: 0.32),
        borderRadius: AppTheme.allBorderRadius,
        child: Image.memory(imageData)
      );
}