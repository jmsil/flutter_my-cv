import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../assets.dart';
import '../button/button.dart';
import '../button/ink_response.dart';
import '../container/container.dart';
import '../layout/edge_insets.dart';
import '../layout/icons.dart';
import '../layout/layout_provider.dart';
import '../scroller.dart';
import 'viewer.dart';

class AppGallery extends AppViewer {
  final GalleryAssets assets;

  AppGallery(this.assets)
    : super(
        direction: Axis.horizontal,
        windowWidth: assets.isPortraitThumbnail ? 1400 : 1800,
        windowHeight: 980,
        barSize:
          assets.thumbnailWidth +
          _State.unselectedThumbnailBorderSize * 2 +
          _State.unselectedThumbnailMargin.horizontal +
          _State.thumbnailsContainerPadding.horizontal,
        barPadding: _State.thumbnailsContainerPadding,
        isTransparentBody: true
      );

  @override
  _State createState() => _State();
}

class _State extends AppViewerState<AppGallery> {
  static const double selectedThumbnailBorderSize = 3;
  static const double unselectedThumbnailBorderSize = 1;
  static const EdgeInsets thumbnailsContainerPadding = AppEdgeInsets.xLarge();
  static const EdgeInsets selectedThumbnailMargin = EdgeInsets.symmetric(vertical: 12);
  static const EdgeInsets unselectedThumbnailMargin = EdgeInsets.symmetric(
    horizontal: 12, vertical: 6
  );

  final List<GlobalKey> thumbnailKeys = [];
  final ScrollController scrollController = ScrollController();

  int index = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.assets.count; i++)
      thumbnailKeys.add(GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onKeyEvent: onKeyEvent,
      child: super.build(context)
    );
  }

  @override
  Widget buildBarWidget(BuildContext context, bool showBarBackground) {
    final AppTheme theme = context.appLayout.theme;
    final List<Widget> thumbnails = [];

    for (int i = 0; i < widget.assets.count; i++) {
      bool isSelected = i == index;
      Widget thumbnail = AnimatedPadding(
        key: thumbnailKeys[i],
        padding: isSelected ? selectedThumbnailMargin : unselectedThumbnailMargin,
        duration: const Duration(milliseconds: 240),
        curve: AppTheme.animationCurve,
        child: AppContainer(
          borderSize: isSelected ? selectedThumbnailBorderSize : unselectedThumbnailBorderSize,
          borderColor: showBarBackground ? theme.overElement1Color1 : theme.overBackgroundColor1,
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

    return AppListView(
      controller: scrollController,
      children: thumbnails
    );
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;

    final Widget imageWidget = Expanded(
      child: Center(
        child: AppContainer(
          margin: const AppEdgeInsets.xLarge(),
          borderSize: 12,
          borderColor: theme.overBackgroundColor1,
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          child: Image.memory(widget.assets.getFile(index + 1), gaplessPlayback: true)
        )
      )
    );

    final Widget closeButton = AppButton.icon(
      icon: AppIcons.close,
      color: theme.overBackgroundColor1,
      onPressed: () => Navigator.pop(context)
    );

    final previousButton = Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: AppButton.icon(
          icon: AppIcons.arrowUp,
          color: theme.overBackgroundColor1,
          onPressed: onPrevious
        )
      )
    );

    final Widget nextButton = Expanded(
      child: Align(
        alignment: Alignment.topRight,
        child: AppButton.icon(
          icon: AppIcons.arrowDown,
          color: theme.overBackgroundColor1,
          onPressed: onNext
        )
      )
    );

    final Widget label = Text(
      '${index + 1}/${ widget.assets.count }',
      style: theme.text1OverBackgroundColor1BoldStyle
    );

    return Row(
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
  }

  void onPrevious() {
    if (index > 0)
      setIndex(index - 1);
  }

  void onNext() {
    if (index < widget.assets.count - 1)
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