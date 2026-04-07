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
  final Color color;
  final Widget child;
  final Function() onPressed;

  AppButton.label(this.isSelected, String label, this.onPressed)
    : color = AppTheme.lightBlue,
      child = Text(
        label,
        style: isSelected ? AppTheme.lightBlueBoldStyle : AppTheme.lightBlueStyle
      );

  AppButton.icon({
    required IconData icon,
    Color? color,
    required this.onPressed
  })
    : isSelected = false,
      this.color = color ?? AppTheme.lightBlue,
      child = Icon(
        icon,
        size: 24,
        color: color ?? AppTheme.lightBlue
      );

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
        color: isSelected ? color.withValues(alpha: 0.16) : null,
        borderSize: isSelected ? 3 : 1,
        borderColor: color,
        borderRadius: AppUiConst.circleBorderRadius,
        child: Center(
          child: child
        )
      ),
      mouseCursor: SystemMouseCursors.click,
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
  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final child = SizedBox(
      width: 84,
      height: 56,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.memory(AppAssets.imageSlider, fit: BoxFit.fill),

          if (isProcessing)
            Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: AppContainer(
                  color: AppTheme.lightBlue,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  child: CircularProgressIndicator(
                    color: AppTheme.darkBlue,
                    strokeWidth: 3,
                    backgroundColor: AppTheme.darkBlue.withValues(alpha: 0.26)
                  )
                )
              )
            )
        ]
      )
    );

    return AppContainer(
      borderColor: AppTheme.lightBlue,
      borderRadius: AppTheme.allBorderRadius,
      isClipped: true,
      child: AppInkResponse(
        padding: const EdgeInsets.all(12),
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
      await widget.assetsFolder.load();
    }
    finally {
      setState(() => isProcessing = false);
    }

    AppGallery.show(context, widget.assetsFolder);
  }
}

class AppInkResponse extends StatelessWidget {
  final EdgeInsets? padding;
  final Color effectsColor;
  final void Function() onPressed;
  final void Function(bool)? onHover;
  final Widget child;

  AppInkResponse({
    this.padding,
    required this.effectsColor,
    required this.onPressed,
    this.onHover,
    required this.child
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
      mouseCursor: SystemMouseCursors.click,
      onTap: onPressed,
      onHover: onHover,
      child: newChild
    );
  }
}