import 'package:flutter/material.dart';

import 'assets.dart';
import 'const.dart';
import 'container/container.dart';
import 'gallery.dart';
import 'theme.dart';

class AppButton extends StatelessWidget {
  static const double _containerSize = 36;
  static final Color effectsColor = AppTheme.lowLightColor.withValues(alpha: 0.32);

  final bool isSelected;
  final Widget child;
  final Function() onPressed;

  AppButton.label(this.isSelected, String label, this.onPressed)
    : child = Text(
        label,
        style: isSelected ? AppTheme.lightBlueBoldStyle : AppTheme.highLightBlueStyle
      );

  AppButton.icon(IconData icon, this.onPressed)
    : isSelected = false,
      child = Icon(icon, size: 24, color: AppTheme.highLightBlue);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: _containerSize,
      splashColor: effectsColor,
      hoverColor: effectsColor,
      highlightColor: effectsColor,
      icon: AppContainer(
        width: _containerSize,
        height: _containerSize,
        borderSize: isSelected ? 3 : 1,
        borderColor: isSelected ? AppTheme.lightBlue : AppTheme.highLightBlue,
        borderRadius: AppUiConst.circleBorderRadius,
        child: Center(
          child: child
        )
      ),
      mouseCursor: SystemMouseCursors.basic,
      onPressed: onPressed
    );
  }
}

class AppImageGalleryButton extends StatefulWidget {
  final AssetsFolder assetsFolder;

  AppImageGalleryButton(this.assetsFolder);

  @override
  _AppImageGalleryButtonState createState() => _AppImageGalleryButtonState();
}

class _AppImageGalleryButtonState extends State<AppImageGalleryButton> {
  static const double padding = 12;
  static const double width = 120;
  static const double height = (width - padding * 2) / 3 * 2 + padding * 2;

  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final child = isProcessing
      ? Center(
          child: CircularProgressIndicator(
            color: AppTheme.darkBlue,
            strokeWidth: 4,
            backgroundColor: AppTheme.darkBlue.withValues(alpha: 0.26)
          ),
        )
      : Image.asset(AppAssets.image_slider, fit: BoxFit.fill);

    return AppContainer(
      width: width,
      height: height,
      borderColor: AppTheme.lightBlue,
      borderRadius: AppTheme.allBorderRadius,
      isClipped: true,
      child: AppInkResponse(
        padding: const EdgeInsets.all(padding),
        effectsColor: AppButton.effectsColor,
        onPressed: onPressed,
        child: child
      )
    );
  }

  void onPressed() async {
    if (isProcessing)
      return;

    setState(() => isProcessing = true);

    try {
      await widget.assetsFolder.precache(context);
      await Future.delayed(Duration(milliseconds: 450));
      AppGallery.show(context, widget.assetsFolder);
    }
    finally {
      setState(() => isProcessing = false);
    }
  }
}

class AppInkResponse extends StatelessWidget {
  final EdgeInsets? padding;
  final Color effectsColor;
  final MouseCursor cursor;
  final void Function() onPressed;
  final void Function(bool)? onHover;
  final Widget? child;

  AppInkResponse({
    this.padding,
    required this.effectsColor,
    this.cursor = SystemMouseCursors.basic,
    required this.onPressed,
    this.onHover,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    Widget? newChild = child;

    if (padding != null) {
      newChild = Padding(
        padding: padding!,
        child: newChild
      );
    }

    return InkResponse(
      focusColor: Colors.transparent,
      hoverColor: effectsColor,
      splashColor: effectsColor,
      highlightColor: effectsColor,
      highlightShape: BoxShape.rectangle,
      splashFactory: InkRipple.splashFactory,
      mouseCursor: cursor,
      onTap: onPressed,
      onHover: onHover,
      child: newChild
    );
  }
}