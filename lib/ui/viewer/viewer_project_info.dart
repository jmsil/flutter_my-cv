import 'package:flutter/widgets.dart';

import '../button/button.dart';
import '../layout/dimens.dart';
import '../layout/icons.dart';
import '../layout/theme.dart';
import '../navigator.dart';
import '../scroller.dart';
import '../strings/strings.dart';
import 'project.dart';
import 'viewer.dart';

class ViewerProjectInfo extends AppViewer {
  final InfoProject project;

  ViewerProjectInfo._(
    this.project
  ) : super(
    direction: Axis.vertical,
    width: 1560,
    barRatioForCompactMode: 0.18,
    crossAxisSizeForCompactMode: 520
  );

  @override
  _State createState() => _State();

  static void show(InfoProject project) {
    AppViewer.show(ViewerProjectInfo._(project));
  }
}

class _State extends AppViewerState<ViewerProjectInfo> {
  static const TextSpan shortSpanSpacer = TextSpan(
    text: '\n\n\u200B', style: TextStyle(fontSize: AppDimens.xSmall));
  static const TextSpan normalSpanSpacer = TextSpan(
    text: '\n\u200B', style: TextStyle(fontSize: AppDimens.normal));
  static const TextSpan largeSpanSpacer = TextSpan(
    text: '\n\n\u200B', style: TextStyle(fontSize: AppDimens.large));

  @override
  Widget buildBar(AppThemeData themeData, double width, double height) {
    return buildBarUtil(themeData, width, height, false);
  }

  @override
  Widget buildCompactModeBar(AppThemeData themeData, double width, double height) {
    return buildBarUtil(themeData, width, height, true);
  }

  Widget buildBarUtil(AppThemeData themeData, double width, double height, bool isCompactMode) {
    final AppThemeDataStyledProperty themeProperty = themeData.overStyled1;
    final builtIcon = Icon(
      AppIcons.webhook,
      size: isCompactMode ? AppDimens.xxLarge : AppDimens.xxxLarge,
      color: themeProperty.color
    );
    final Widget builtTitle = Text(
      widget.project.title,
      style: isCompactMode ? themeProperty.normalHeader.bold : themeProperty.largeHeader.bold
    );
    final Widget builtDescription = Text(
      widget.project.description,
      style: isCompactMode ? themeProperty.normalText.regular : themeProperty.largeText.regular
    );
    final Widget builtCloseButton = AppIconButton(
      icon: AppIcons.close,
      themeProperty: themeProperty,
      onPressed: AppNavigator.pop
    );

    return Padding(
      padding: isCompactMode
        ? const AppEdgeInsets.normal()
        : const AppEdgeInsets.large(vertical: AppDimens.xLarge),
      child: isCompactMode
        ? Column(
            spacing: AppDimens.small,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: AppDimens.normal,
                children: [
                  builtIcon,
                  Expanded(child: builtTitle),
                  builtCloseButton
                ]
              ),
              builtDescription
            ]
          )
        : Row(
            spacing: AppDimens.normal,
            children: [
              builtIcon,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [builtTitle, builtDescription]
                )
              ),
              builtCloseButton
            ]
          )
    );
  }

  @override
  Widget buildBody(AppThemeData themeData, double width, double height) {
    final List<Widget> children = [];
    final List<TextSpan> spans = [];
    final List<String> lines = widget.project.info.split(Strings.splitTag);
    final List<Widget> placeholders = widget.project.buildPlaceholderWidgets();

    for (String line in lines) {
      if (line == Strings.widgetTag)
        addPlaceholder(children, placeholders, spans);
      else if (line.startsWith(Strings.titleTag))
        addTitle(line, spans, children.isNotEmpty, themeData);
      else if (line.isNotEmpty)
        addText(line, spans, children.isNotEmpty, themeData);
    }

    addRichText(children, spans);

    return AppListView(
      padding: const AppEdgeInsets.normal(bottom: AppDimens.xLarge),
      children: children
    );
  }

  void addPlaceholder(List<Widget> children, List<Widget> placeholders, List<TextSpan> spans) {
    if (spans.isNotEmpty)
      spans.add(normalSpanSpacer);
    else if (children.isNotEmpty)
      children.add(AppSpacing.normalV);

    addRichText(children, spans);
    children.add(placeholders.removeAt(0));
  }

  void addTitle(String line, List<TextSpan> spans, bool hasChildren, AppThemeData themeData) {
    if (hasChildren || spans.isNotEmpty)
      spans.add(largeSpanSpacer);

    spans.add(TextSpan(
      text: line.replaceAll(Strings.titleTag, ''),
      style: themeData.overStyled1.normalHeader.bold
    ));
  }

  void addText(String line, List<TextSpan> spans, bool hasChildren, AppThemeData themeData) {
    if (spans.isNotEmpty)
      spans.add(shortSpanSpacer);
    else if (hasChildren)
      spans.add(normalSpanSpacer);

    spans.add(TextSpan(
      text: line.replaceAll('\n▪', '\n    ▪'),
      style: themeData.overStyled1.normalText.regular
    ));
  }

  void addRichText(List<Widget> children, List<TextSpan> textSpans) {
    if (textSpans.isNotEmpty) {
      children.add(Text.rich(
        TextSpan(children: List.of(textSpans))
      ));
      textSpans.clear();
    }
  }
}