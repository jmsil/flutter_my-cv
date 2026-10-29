import 'dart:math';

import 'package:flutter/material.dart';

class AppWrap extends LayoutBuilder {
  AppWrap({
    required double width,
    double maxStretchPercent = 0.25,
    required double spacing,
    double? runSpacing,
    required List<Widget> children
  }) : super(
    builder: (BuildContext context, BoxConstraints constraints) {
      final double availableWidth = constraints.maxWidth.isFinite
        ? constraints.maxWidth
        : width;
      final double maxChildWidth = width * (1 + maxStretchPercent);
      final int count = max(1, (availableWidth + spacing) / (maxChildWidth + spacing)).ceil();
      final double totalSpacing = (count - 1) * spacing;
      final double boxWidth = max(0, (availableWidth - totalSpacing) / count);

      return Wrap(
        spacing: spacing,
        runSpacing: runSpacing ?? spacing,
        children: children.map(
          (child) => SizedBox(width: boxWidth, child: child)
        ).toList()
      );
    }
  );
}