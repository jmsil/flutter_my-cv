import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../assets.dart';
import '../button/button.dart';
import '../button/ink_response.dart';
import '../container/container.dart';
import '../layout/edge_insets.dart';
import '../layout/icons.dart';
import '../layout/layout.dart';
import '../layout/theme.dart';
import '../scroller.dart';
import '../theme.dart' as OldTheme;
import 'viewer.dart';

class AppGallery extends StatefulWidget {
  final GalleryAssets assets;

  AppGallery(this.assets);

  @override
  _State createState() => _State();
}

class _State extends State<AppGallery> {
  static const double selectedThumbnailBorderSize = 3;
  static const double unselectedThumbnailBorderSize = 1;
  static const EdgeInsets thumbnailsContainerPadding = AppEdgeInsets.xLarge();
  static const EdgeInsets selectedThumbnailMargin = EdgeInsets.symmetric(vertical: 12);
  static const EdgeInsets unselectedThumbnailMargin = EdgeInsets.symmetric(
    horizontal: 12, vertical: 6
  );

  int index = 0;
  late final int count;
  late final double thumbnailWidth;
  late final bool isPortrait;

  final List<GlobalKey> thumbnailKeys = [];
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    count = widget.assets.count;
    thumbnailWidth = widget.assets.thumbnailWidth.toDouble();
    isPortrait = thumbnailWidth < widget.assets.thumbnailHeight;

    for (int i = 0; i < count; i++)
      thumbnailKeys.add(GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> thumbnails = [];

    for (int i = 0; i < count; i++) {
      bool isSelected = i == index;
      Widget thumbnail = AnimatedPadding(
        key: thumbnailKeys[i],
        padding: isSelected ? selectedThumbnailMargin : unselectedThumbnailMargin,
        duration: const Duration(milliseconds: 240),
        curve: AppTheme.animationCurve,
        child: AppContainer(
          borderSize: isSelected ? selectedThumbnailBorderSize : unselectedThumbnailBorderSize,
          borderColor: OldTheme.AppTheme.lightBlue,
          borderRadius: isSelected
            ? const BorderRadius.all(Radius.circular(12))
            : const BorderRadius.all(Radius.circular(8)),
          isClipped: true,
          child: AppInkResponse(
            effectsColor: Colors.transparent,
            onPressed: () => setIndex(i),
            child: Image.memory(widget.assets.getThumbnail(i + 1), fit: BoxFit.fill)
          )
        )
      );
      thumbnails.add(thumbnail);
    }

    final Widget imageWidget = Expanded(
      child: Center(
        child: AppContainer(
          margin: const AppEdgeInsets.xLarge(),
          borderSize: 12,
          borderColor: OldTheme.AppTheme.darkColor,
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          child: Image.memory(
            widget.assets.getFile(index + 1),
            gaplessPlayback: true
          )
        )
      )
    );

    final Widget closeButton = AppButton.icon(
      icon: AppIcons.close,
      color: OldTheme.AppTheme.darkColor,
      onPressed: () => Navigator.pop(context)
    );

    final previousButton = Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: AppButton.icon(
          icon: AppIcons.arrowUp,
          color: OldTheme.AppTheme.darkColor,
          onPressed: onPrevious
        )
      )
    );

    final Widget nextButton = Expanded(
      child: Align(
        alignment: Alignment.topRight,
        child: AppButton.icon(
          icon: AppIcons.arrowDown,
          color: OldTheme.AppTheme.darkColor,
          onPressed: onNext
        )
      )
    );

    final Widget label = Text(
      '${index + 1}/${count}',
      style: OldTheme.AppTheme.darkBoldStyle
    );

    final Widget bodyWidget = Row(
      children: [
        imageWidget,
        Padding(
          padding: const AppEdgeInsets.large(),
          child: Column(
            spacing: AppLayout.xLargeSpacing,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              closeButton,
              previousButton,
              nextButton,
              label
            ]
          )
        )
      ]
    );

    return Focus(
      autofocus: true,
      onKeyEvent: onKeyEvent,
      child: AppViewer(
        direction: Axis.horizontal,
        windowWidth: isPortrait ? 1400 : 1800,
        windowHeight: 980,
        barWidth: thumbnailWidth +
          unselectedThumbnailBorderSize * 2 +
          unselectedThumbnailMargin.horizontal +
          thumbnailsContainerPadding.horizontal,
        barPadding: thumbnailsContainerPadding,
        bodyIsTransparent: true,
        barWidget: AppListView(
          controller: scrollController,
          children: thumbnails
        ),
        bodyWidget: bodyWidget
      )
    );
  }

  void onPrevious() {
    if (index > 0)
      setIndex(index - 1);
  }

  void onNext() {
    if (index < count - 1)
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