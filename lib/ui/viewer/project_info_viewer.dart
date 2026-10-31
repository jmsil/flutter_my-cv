import 'package:flutter/material.dart';
import 'package:my_cv/ui/scroller.dart';

import '../button/button.dart';
import '../layout/edge_insets.dart';
import '../layout/icons.dart';
import '../layout/layout_model.dart';
import '../strings/strings.dart';
import 'project.dart';
import 'viewer.dart';

class ProjectInfoViewer extends AppViewer {
  final InfoProject project;

  ProjectInfoViewer(
    this.project
  ) : super(
    direction: Axis.vertical,
    windowWidth: 1560,
    barPadding: const AppEdgeInsets.large(vertical: AppEdgeInsets.xLargeValue)
  );

  @override
  _State createState() => _State();
}

class _State extends AppViewerState<ProjectInfoViewer> {
  static const TextSpan shortSpanSpacer = TextSpan(
    text: '\n\n\u200B', style: TextStyle(fontSize: AppLayout.shortSpacing));
  static const TextSpan normalSpanSpacer = TextSpan(
    text: '\n\u200B', style: TextStyle(fontSize: AppLayout.normalSpacing));
  static const TextSpan largeSpanSpacer = TextSpan(
    text: '\n\n\u200B', style: TextStyle(fontSize: AppLayout.largeSpacing));

  @override
  Widget buildBar(AppThemeData themeData) {
    final Widget builtTitleDetail = Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '${widget.project.title}\n', style: themeData.largeHeader.over1.bold),
          TextSpan(text: widget.project.description, style: themeData.largeText.over1.regular)
        ]
      )
    );

    return Row(
      spacing: AppLayout.normalSpacing,
      children: [
        Icon(AppIcons.webhook, size: 64, color: themeData.overColor1),
        Expanded(child: builtTitleDetail),
        AppButton.icon(
          icon: AppIcons.close,
          color: themeData.overColor1,
          onPressed: () => Navigator.pop(context)
        )
      ]
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
      padding: const AppEdgeInsets.normal(bottom: AppEdgeInsets.xLargeValue),
      children: children
    );
  }

  void addPlaceholder(List<Widget> children, List<Widget> placeholders, List<TextSpan> spans) {
    if (spans.isNotEmpty)
      spans.add(normalSpanSpacer);
    else if (children.isNotEmpty)
      children.add(AppLayout.normalVerticalSpacer);

    addRichText(children, spans);
    children.add(placeholders.removeAt(0));
  }

  void addTitle(String line, List<TextSpan> spans, bool hasChildren, AppThemeData themeData) {
    if (hasChildren || spans.isNotEmpty)
      spans.add(largeSpanSpacer);

    spans.add(TextSpan(
      text: line.replaceAll(Strings.titleTag, ''),
      style: themeData.normalHeader.over1.bold
    ));
  }

  void addText(String line, List<TextSpan> spans, bool hasChildren, AppThemeData themeData) {
    if (spans.isNotEmpty)
      spans.add(shortSpanSpacer);
    else if (hasChildren)
      spans.add(normalSpanSpacer);

    spans.add(TextSpan(
      text: line.replaceAll('\n▪', '\n    ▪'),
      style: themeData.normalText.over1.regular
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