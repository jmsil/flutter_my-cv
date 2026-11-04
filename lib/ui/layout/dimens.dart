import 'package:flutter/material.dart';

class AppDimens {
  AppDimens._();

  static const double xxSmall = 2;
  static const double xSmall = 4;
  static const double small = 8;
  static const double normal = 16;
  static const double large = 24;
  static const double xLarge = 32;
}

class AppEdgeInsets extends EdgeInsets {
  const AppEdgeInsets.xxSmall({
    double? left, double? top, double? right, double? bottom, double? horizontal, double? vertical
  }) : this._(AppDimens.xxSmall, left, top, right, bottom, horizontal, vertical);

  const AppEdgeInsets.xSmall({
    double? left, double? top, double? right, double? bottom, double? horizontal, double? vertical
  }) : this._(AppDimens.xSmall, left, top, right, bottom, horizontal, vertical);

  const AppEdgeInsets.small({
    double? left, double? top, double? right, double? bottom, double? horizontal, double? vertical
  }) : this._(AppDimens.small, left, top, right, bottom, horizontal, vertical);

  const AppEdgeInsets.normal({
    double? left, double? top, double? right, double? bottom, double? horizontal, double? vertical
  }) : this._(AppDimens.normal, left, top, right, bottom, horizontal, vertical);

  const AppEdgeInsets.large({
    double? left, double? top, double? right, double? bottom, double? horizontal, double? vertical
  }) : this._(AppDimens.large, left, top, right, bottom, horizontal, vertical);

  const AppEdgeInsets.xLarge({
    double? left, double? top, double? right, double? bottom, double? horizontal, double? vertical
  }) : this._(AppDimens.xLarge, left, top, right, bottom, horizontal, vertical);

  const AppEdgeInsets._(
    double all,
    double? left, double? top, double? right, double? bottom,
    double? horizontal, double? vertical
  ) : super.fromLTRB(
    left ?? horizontal ?? all,
    top ?? vertical ?? all,
    right ?? horizontal ?? all,
    bottom ?? vertical ?? all
  );
}

class AppSpacing {
  AppSpacing._();

  static const SizedBox xxSmallH = SizedBox(width: AppDimens.xxSmall);
  static const SizedBox xxSmallV = SizedBox(height: AppDimens.xxSmall);

  static const SizedBox xSmallH = SizedBox(width: AppDimens.xSmall);
  static const SizedBox xSmallV = SizedBox(height: AppDimens.xSmall);

  static const SizedBox smallH = SizedBox(width: AppDimens.small);
  static const SizedBox smallV = SizedBox(height: AppDimens.small);

  static const SizedBox normalH = SizedBox(width: AppDimens.normal);
  static const SizedBox normalV = SizedBox(height: AppDimens.normal);

  static const SizedBox largeH = SizedBox(width: AppDimens.large);
  static const SizedBox largeV = SizedBox(height: AppDimens.large);

  static const SizedBox xLargeH = SizedBox(width: AppDimens.xLarge);
  static const SizedBox xLargeV = SizedBox(height: AppDimens.xLarge);
}