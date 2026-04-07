import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'assets.dart';
import 'button.dart';
import 'const.dart';
import 'container/container.dart';
import 'overlay_bar.dart';
import 'scroller.dart';
import 'theme.dart';

class AppGallery extends StatefulWidget {
  final GalleryAssets assets;

  AppGallery._(this.assets);

  @override
  _State createState() => _State();

  static void show(BuildContext context, GalleryAssets assets) {
    showGeneralDialog<void>(
      context: context,
      barrierLabel: '',
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.7),
      transitionDuration: const Duration(milliseconds: 380),

      transitionBuilder: (transCtx, transAnim, transSecAnim, transChild) {
        return FadeUpwardsPageTransitionsBuilder().buildTransitions(
          null, transCtx, transAnim, transSecAnim, transChild
        );
      },

      pageBuilder: (pageCtx, pageAnim, pageSecAnim) {
        return AppGallery._(assets);
      }
    );
  }
}

class _State extends State<AppGallery> {
  static const double selectedThumbnailBorderSize = 3;
  static const double unselectedThumbnailBorderSize = 1;
  static const EdgeInsets thumbnailsContainerPadding = ThemedEdgeInsets.xLarge();
  static const EdgeInsets selectedThumbnailMargin = EdgeInsets.symmetric(vertical: 12);
  static const EdgeInsets unselectedThumbnailMargin = EdgeInsets.symmetric(
    horizontal: 12, vertical: 6
  );
  static final Color bodyBackgroundColor = AppTheme.lowDarkColor;

  int index = 0;
  late final int fileCount;
  late final double thumbnailWidth;
  late final bool isPortrait;

  final List<GlobalKey> thumbnailKeys = [];
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    fileCount = widget.assets.count;
    thumbnailWidth = widget.assets.thumbnailWidth.toDouble();
    isPortrait = thumbnailWidth < widget.assets.thumbnailHeight;

    for (int i = 0; i < fileCount; i++)
      thumbnailKeys.add(GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> thumbnails = [];

    for (int i = 0; i < fileCount; i++) {
      bool isSelected = i == index;
      Widget thumbnail = AnimatedPadding(
        key: thumbnailKeys[i],
        padding: isSelected ? selectedThumbnailMargin : unselectedThumbnailMargin,
        duration: const Duration(milliseconds: 240),
        curve: AppTheme.animationCurve,
        child: AppContainer(
          borderSize: isSelected ? selectedThumbnailBorderSize : unselectedThumbnailBorderSize,
          borderColor: AppTheme.lightBlue,
          borderRadius: isSelected
            ? const BorderRadius.all(Radius.circular(12))
            : const BorderRadius.all(Radius.circular(8)),
          isClipped: true,
          child: AppInkResponse(
            effectsColor: Colors.transparent,
            onPressed: () => setIndex(i),
            child: Image.memory(widget.assets.getThumbnail(i), fit: BoxFit.fill)
          )
        )
      );
      thumbnails.add(thumbnail);
    }

    final Widget thumbnailsWidget = BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: AppContainer(
        width: thumbnailWidth +
          unselectedThumbnailBorderSize * 2 +
          unselectedThumbnailMargin.horizontal +
          thumbnailsContainerPadding.horizontal,
        padding: thumbnailsContainerPadding,
        color: AppTheme.highDarkColor.withValues(alpha: 0.6),
        child: AppListView(
          controller: scrollController,
          children: thumbnails
        )
      )
    );

    final Widget imageWidget = Expanded(
      child: Center(
        child: OverlayBar(
          radius: AppTheme.radiusValue,
          startForegroundColor: bodyBackgroundColor,
          endForegroundColor: bodyBackgroundColor,
          child: Image.memory(
            widget.assets.getImage(index),
            gaplessPlayback: true
          )
        )
      )
    );

    final Widget closeButton = AppButton.icon(
      icon: AppIcons.close,
      onPressed: () => Navigator.pop(context)
    );

    final previousButton = Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: AppButton.icon(
          icon: AppIcons.arrowUp,
          onPressed: onPrevious
        )
      )
    );

    final Widget nextButton = Expanded(
      child: Align(
        alignment: Alignment.topRight,
        child: AppButton.icon(
          icon: AppIcons.arrowDown,
          onPressed: onNext
        )
      )
    );

    final Widget label = Text(
      '${index + 1}/${fileCount}',
      style: AppTheme.lightBlueStyle
    );

    final Widget controlsWidget = Column(
      spacing: AppTheme.xLargeSpacingValue,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        closeButton,
        previousButton,
        nextButton,
        label
      ]
    );

    final Widget bodyWidget = Expanded(
      child: AppContainer(
        color: bodyBackgroundColor,
        padding: const ThemedEdgeInsets.xLarge(),
        child: Row(
          spacing: ThemedEdgeInsets.xLargeValue,
          children: [
            imageWidget,
            controlsWidget
          ]
        )
      )
    );

    return Focus(
      autofocus: true,
      onKeyEvent: onKeyEvent,
      child: Center(
        child: AppContainer(
          width: isPortrait ? 1400 : 1800,
          height: 960,
          margin: const ThemedEdgeInsets.normal(),
          borderColor: AppTheme.lightBlue,
          borderRadius: AppTheme.allBorderRadius,
          isClipped: true,
          child: Row(
            children: [
              thumbnailsWidget,
              bodyWidget
            ]
          )
        )
      )
    );
  }

  void onPrevious() {
    if (index > 0)
      setIndex(index - 1);
  }

  void onNext() {
    if (index < fileCount - 1)
      setIndex(index + 1);
  }

  KeyEventResult onKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent) {
      if (
        event.logicalKey == LogicalKeyboardKey.arrowLeft ||
        event.logicalKey == LogicalKeyboardKey.arrowUp
      )
        onPrevious();
      else if (
        event.logicalKey == LogicalKeyboardKey.arrowRight ||
        event.logicalKey == LogicalKeyboardKey.arrowDown
      )
        onNext();
    }

    return KeyEventResult.ignored;
  }

  void setIndex(int newIndex) {
    if (newIndex == index)
      return;

    setState(() {
      double selectedHeight = thumbnailKeys[index].currentContext!.size!.height;
      double unselectedHeight = thumbnailKeys[newIndex].currentContext!.size!.height;
      index = newIndex;
      double offset =
        unselectedHeight * index +
        selectedHeight / 2 -
        scrollController.position.viewportDimension / 2;
      scrollController.animateTo(
        offset.clamp(0, scrollController.position.maxScrollExtent),
        duration: AppTheme.animationDuration,
        curve: AppTheme.animationCurve
      );
    });
  }
}