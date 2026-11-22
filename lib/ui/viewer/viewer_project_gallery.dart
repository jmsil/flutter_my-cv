import 'dart:math';

import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

import '../assets.dart';
import '../button/button.dart';
import '../button/ink_response.dart';
import '../container.dart';
import '../layout/dimens.dart';
import '../layout/icons.dart';
import '../layout/theme.dart';
import '../scroller.dart';
import 'viewer.dart';

class ViewerProjectGallery extends AppViewer {
  final GalleryAssetsArchive assets;

  ViewerProjectGallery(
    this.assets
  ) : super(
    direction: Axis.horizontal,
    width: assets.aspectRatio < 1 ? 1400 : 1800,
    height: 980,
    maxBarRatio: 0.25,
    bodyAspectRatio: assets.aspectRatio
  );

  @override
  _State createState() => _State();
}

class _State extends AppViewerState<ViewerProjectGallery> {
  static const double selectedThumbnailBorderSize = 4;
  static const double unselectedThumbnailBorderSize = 2;
  static const EdgeInsets thumbnailsPadding = AppEdgeInsets.xLarge(vertical: AppDimens.large);
  static const EdgeInsets selectedThumbnailMargin = EdgeInsets.symmetric(vertical: 12);
  static const EdgeInsets unselectedThumbnailMargin = EdgeInsets.symmetric(
    horizontal: 12, vertical: 6);

  final List<GlobalKey> thumbnailKeys = [];
  final ScrollController scrollController = ScrollController(
    debugLabel: 'gallery_viewer_thumbnails');

  int index = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.assets.count; i++)
      thumbnailKeys.add(GlobalKey());
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
  Widget buildBar(AppThemeData themeData, Size screenSize) {
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
          borderColor: themeData.over1.color,
          borderRadius: isSelected
            ? const BorderRadius.all(Radius.circular(12))
            : const BorderRadius.all(Radius.circular(8)),
          child: AppInkResponse(
            onPressed: () => setIndex(i),
            child: Image.memory(widget.assets.getThumbnail(i + 1), fit: BoxFit.fill)
          )
        )
      );
      thumbnails.add(thumbnail);
    }

    return SizedBox(
      width: widget.assets.thumbnailWidth +
        unselectedThumbnailBorderSize * 2 +
        unselectedThumbnailMargin.horizontal +
        thumbnailsPadding.horizontal,
      child: Padding(
        padding: thumbnailsPadding,
        child: AppListView(
          controller: scrollController,
          children: thumbnails
        )
      )
    );
  }

  @override
  Widget buildBody(AppThemeData themeData, double width, double height) {
    return GestureDetector(
      onHorizontalDragEnd: onDrag,
      onVerticalDragEnd: onDrag,
      child: Center(
        child: Container(
          margin: isCompactMode
            ? const AppEdgeInsets.normal()
            : const AppEdgeInsets.xLarge(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(min(min(width, height) * 0.025, 12) * 2.67),
            boxShadow: [
              BoxShadow(color: Colors.black38, blurRadius: 16)
            ]
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.memory(widget.assets.getFile(index + 1), gaplessPlayback: true)
        )
      )
    );
  }

  @override
  Widget? buildBodyRightToolbar(AppThemeData themeData, double height) {
    return buildBodyToolbar(themeData, Axis.vertical, height);
  }

  @override
  Widget? buildBodyBottomToolbar(AppThemeData themeData, double width) {
    return buildBodyToolbar(themeData, Axis.horizontal, width);
  }

  Widget buildBodyToolbar(AppThemeData themeData, Axis direction, double size) {
    final AppThemeDataStyledProperty themeProperty = themeData.overStyled1;
    final bool isHorizontalDirection = direction == Axis.horizontal;

    final List<Widget> children = [
      Expanded(
        child: Align(
          alignment: isHorizontalDirection ? Alignment.center : Alignment.topCenter,
          child: AppButton.icon(
            icon: isHorizontalDirection ? AppIcons.back : AppIcons.close,
            themeProperty: themeProperty,
            onPressed: () => Navigator.pop(context)
          )
        )
      ),

      if (size >= (isHorizontalDirection ? 380 : 320)) ...[
        AppButton.icon(
          icon: isHorizontalDirection
            ? AppIcons.arrowLeft
            : AppIcons.arrowUp,
          themeProperty: themeProperty,
          onPressed: onPrevious
        ),

        isHorizontalDirection
          ? isCompactMode ? AppSpacing.normalH : AppSpacing.xLargeH
          : isCompactMode ? AppSpacing.normalV : AppSpacing.xLargeV,

        AppButton.icon(
          icon: isHorizontalDirection
            ? AppIcons.arrowRight
            : AppIcons.arrowDown,
          themeProperty: themeProperty,
          onPressed: onNext
        )
      ],

      Expanded(
        child: Align(
          alignment: isHorizontalDirection ? Alignment.center : Alignment.bottomCenter,
          child: Text(
            '${index + 1}/${widget.assets.count}',
            style: themeProperty.normalText.bold
          )
        )
      )
    ];

    return Padding(
      padding: isCompactMode
        ? AppEdgeInsets.normal(
            left: isHorizontalDirection ? null : 0,
            top: isHorizontalDirection ? 0 : null
          )
        : const AppEdgeInsets.large(),
      child: Flex(direction: direction, children: children)
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

  void onDrag(DragEndDetails details) {
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