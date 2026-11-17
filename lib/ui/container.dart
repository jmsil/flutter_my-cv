import 'package:material_ui/material_ui.dart';

import 'layout/theme.dart';

class AppContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double borderSize;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final Color? gradientColor;
  final Axis gradientAxis;
  final bool enableClip;
  final Widget? child;

  AppContainer({
    super.key,
    this.width,
    this.height,
    this.color,
    this.margin,
    this.padding,
    this.borderSize = 1,
    this.borderColor,
    this.borderRadius,
    this.enableClip = false,
    this.child
  }) :
    gradientColor = null,
    gradientAxis = Axis.horizontal;

  AppContainer.gradient({
    this.width,
    this.height,
    required Color color,
    this.margin,
    this.padding,
    this.borderSize = 1,
    this.borderColor,
    this.borderRadius,
    this.gradientColor,
    this.gradientAxis = Axis.horizontal,
    this.child
  }) :
    this.color = color,
    this.enableClip = false;

  @override
  Widget build(BuildContext context) {
    Widget? builtWidget = child;
    final BorderSide? borderSide = borderColor == null || borderSize <= 0
      ? null : BorderSide(width: borderSize, color: borderColor!);
    final EdgeInsets? builtPadding = _getPadding(borderSide != null);

    if (builtPadding != null)
      builtWidget = Padding(padding: builtPadding, child: builtWidget);

    builtWidget = gradientColor == null
      ? Material(
          color: color,
          type: color == null ? MaterialType.transparency : MaterialType.canvas,
          shape: borderRadius != null || borderSide != null
            ? RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.zero,
                side: borderSide ?? BorderSide.none
              )
            : null,
          clipBehavior: enableClip ? Clip.hardEdge : Clip.none,
          child: builtWidget
        )
      : DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: gradientAxis == Axis.horizontal
                ? Alignment.topCenter : Alignment.centerLeft,
              end: gradientAxis == Axis.horizontal
                ? Alignment.bottomCenter : Alignment.centerRight,
              colors: [
                color!,
                Color.alphaBlend(gradientColor!.withDecorationAlpha, color!),
                color!
              ]
            ),
            borderRadius: borderRadius,
            border: borderSide == null ? null : Border.fromBorderSide(borderSide)
          ),
          child: builtWidget
        );

    if (width != null || height != null) {
      builtWidget = SizedBox(
        width: width, height: height,
        child: builtWidget
      );
    }

    if (margin != null)
      builtWidget = Padding(padding: margin!, child: builtWidget);

    return builtWidget;
  }

  EdgeInsets? _getPadding(bool hasBorder) {
    if (hasBorder) {
      return padding == null
        ? EdgeInsets.all(borderSize)
        : EdgeInsets.fromLTRB(
            padding!.left + borderSize,
            padding!.top + borderSize,
            padding!.right + borderSize,
            padding!.bottom + borderSize
          );
    }

    return padding;
  }
}

class AppCard extends AppContainer {
  AppCard({
    required AppTheme theme,
    super.padding,
    super.borderRadius = AppTheme.allBorderRadius,
    super.child
  }) : super(
    color: theme.background.surfaceColor2.withCardFillAlpha,
    borderColor: theme.background.surfaceColor2.withHighDecorationAlpha
  );
}