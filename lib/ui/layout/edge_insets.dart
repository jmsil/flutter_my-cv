import 'package:flutter/painting.dart';

class AppEdgeInsets extends EdgeInsets {
  static const double smallValue = 8;
  static const double normalValue = 16;
  static const double largeValue = 24;
  static const double xLargeValue = 32;

  const AppEdgeInsets.small({
    double? left, double? top, double? right, double? bottom, double? horizontal, double? vertical
  }) : this._(smallValue, left, top, right, bottom, horizontal, vertical);

  const AppEdgeInsets.normal({
    double? left, double? top, double? right, double? bottom, double? horizontal, double? vertical
  }) : this._(normalValue, left, top, right, bottom, horizontal, vertical);

  const AppEdgeInsets.large({
    double? left, double? top, double? right, double? bottom, double? horizontal, double? vertical
  }) : this._(largeValue, left, top, right, bottom, horizontal, vertical);

  const AppEdgeInsets.xLarge({
    double? left, double? top, double? right, double? bottom, double? horizontal, double? vertical
  }) : this._(xLargeValue, left, top, right, bottom, horizontal, vertical);

  const AppEdgeInsets._(
    double all,
    double? left, double? top, double? right, double? bottom,
    double? horizontal, double? vertical
  )
    : super.fromLTRB(
        left ?? horizontal ?? all,
        top ?? vertical ?? all,
        right ?? horizontal ?? all,
        bottom ?? vertical ?? all
      );
}