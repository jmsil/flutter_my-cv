import 'package:flutter/material.dart';

import 'assets.dart';
import 'container/container.dart';
import 'gallery.dart';
import 'theme.dart';

class AppButton extends StatelessWidget {
  static const double _containerSize = 36;
  static Color _effectsColor = AppTheme.lowLightColor.withValues(alpha: 0.32);

  final bool isSelected;
  final Widget child;
  final Function() onPressed;

  AppButton.label(this.isSelected, String label, this.onPressed)
    :
    child = Text(
      label,
      style: isSelected ? AppTheme.lightBlueStyle : AppTheme.highLightStyle
    );

  AppButton.icon(IconData icon, this.onPressed)
    :
    isSelected = false,
    child = Icon(icon, size: 24, color: AppTheme.highLightColor);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: _containerSize,
      splashColor: _effectsColor,
      hoverColor: _effectsColor,
      highlightColor: _effectsColor,
      icon: AppContainer(
        width: _containerSize,
        height: _containerSize,
        borderSize: 2,
        borderColor: isSelected ? AppTheme.lightBlue : AppTheme.highLightColor,
        borderRadius: BorderRadius.circular(_containerSize),
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
      borderRadius: AppTheme.appThemeRadius,
      isClipped: true,
      child: InkResponse(
        focusColor: Colors.transparent,
        hoverColor: AppButton._effectsColor,
        splashColor: AppButton._effectsColor,
        highlightColor: AppButton._effectsColor,
        highlightShape: BoxShape.rectangle,
        splashFactory: InkRipple.splashFactory,
        mouseCursor: SystemMouseCursors.basic,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: child
        )
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