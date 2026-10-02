import 'dart:math';

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
        windowDirection: Axis.horizontal,
        windowWidth: assets.aspectRatio < 1 ? 1400 : 1800,
        windowHeight: 980,
        barSize:
          assets.thumbnailWidth +
          _State.unselectedThumbnailBorderSize * 2 +
          _State.unselectedThumbnailMargin.horizontal +
          _State.thumbnailsContainerPadding.horizontal,
        barPadding: _State.thumbnailsContainerPadding,
        bodyAspectRatio: assets.aspectRatio,
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
  final ScrollController scrollController = ScrollController(
    debugLabel: 'gallery_viewer_thumbnails'
  );

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
  Widget buildBar(bool showBackground) {
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
          borderColor: showBackground ? theme.overElement1Color1 : theme.overBackgroundColor1,
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
  Widget buildBody(double width, double height) {
    final AppTheme theme = context.appLayout.theme;
    final double borderSize = min(min(width, height) * 0.025, 12);

    return GestureDetector(
      onHorizontalDragEnd: _onDrag,
      onVerticalDragEnd: _onDrag,
      child: Center(
        child: AppContainer(
          margin: isCompactMode
            ? const AppEdgeInsets.normal()
            : const AppEdgeInsets.xLarge(),
          borderSize: borderSize,
          borderColor: theme.overBackgroundColor1,
          borderRadius: BorderRadius.circular(borderSize * 2.67),
          child: Image.memory(widget.assets.getFile(index + 1), gaplessPlayback: true)
        )
      )
    );
  }

  @override
  Widget? buildBodyRightToolbar(double width) {
    return _buildBodyToolbarWidget(Axis.vertical, width);
  }

  @override
  Widget? buildBodyBottomToolbar(double height) {
    return _buildBodyToolbarWidget(Axis.horizontal, height);
  }

  Widget _buildBodyToolbarWidget(Axis direction, double size) {
    final AppTheme theme = context.appLayout.theme;
    final bool isHorizontalDirection = direction == Axis.horizontal;
    final List<Widget> buttons = [];

    buttons.add(
      AppButton.icon(
        icon: isHorizontalDirection
          ? AppIcons.back
          : AppIcons.close,
        color: theme.overBackgroundColor1,
        onPressed: () => Navigator.pop(context)
      )
    );

    if (size >= 380) {
      buttons.add(
        Flex(
          direction: direction,
          spacing: isCompactMode
            ? AppLayout.normalSpacing
            : AppLayout.xLargeSpacing,
          children: [
            AppButton.icon(
              icon: isHorizontalDirection
                ? AppIcons.arrowLeft
                : AppIcons.arrowUp,
              color: theme.overBackgroundColor1,
              onPressed: onPrevious
            ),
            AppButton.icon(
              icon: isHorizontalDirection
                ? AppIcons.arrowRight
                : AppIcons.arrowDown,
              color: theme.overBackgroundColor1,
              onPressed: onNext
            )
          ]
        )
      );
    }

    buttons.add(
      Text(
        '${index + 1}/${ widget.assets.count }',
        style: theme.text1OverBackgroundColor1BoldStyle
      )
    );

    return Padding(
      padding: isCompactMode
        ? AppEdgeInsets.normal(
            right: isHorizontalDirection ? AppEdgeInsets.normalValue * 1.75 : null)
        : AppEdgeInsets.large(
            right: isHorizontalDirection ? AppEdgeInsets.largeValue * 1.75 : null),
      child: Flex(
        direction: direction,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buttons
      )
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

  void _onDrag(DragEndDetails details) {
    if (details.primaryVelocity! > 0)
      onPrevious();
    else if (details.primaryVelocity! < 0)
      onNext();
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