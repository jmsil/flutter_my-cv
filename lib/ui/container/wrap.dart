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
      final List<Widget> rows = [];
      final double constraintsWidth = constraints.maxWidth.isFinite
        ? constraints.maxWidth
        : width;
      final double maxChildStretch = width * (1 + maxStretchPercent);
      final int colCount = max(
          1, (constraintsWidth + spacing) / (maxChildStretch + spacing)
        ).ceil();
      final int rowCount = (children.length / colCount).ceil();
      final double totalSpacing = (colCount - 1) * spacing;
      final double boxWidth = max(0, (constraintsWidth - totalSpacing) / colCount);

      for (int i = 0; i < rowCount; i++) {
        List<Widget> rowChildren = [];

        for (int j = i * colCount; j < min(children.length, (i + 1) * colCount); j++)
          rowChildren.add(SizedBox(width: boxWidth, child: children[j]));

        rows.add(IntrinsicHeight(
          child: Row(spacing: spacing, children: rowChildren)
        ));
      }

      return Column(
        spacing: runSpacing ?? spacing,
        children: rows
      );
    }
  );
}