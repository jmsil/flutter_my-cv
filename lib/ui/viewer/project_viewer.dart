import 'package:flutter/material.dart';
import 'package:my_cv/ui/scroller.dart';

import '../button/button.dart';
import '../layout/edge_insets.dart';
import '../layout/icons.dart';
import '../layout/layout_model.dart';
import '../strings/strings.dart';
import 'project.dart';
import 'viewer.dart';

class AppProjectViewer extends AppViewer {
  final InfoProject project;

  AppProjectViewer(
    this.project
  ) : super(
    windowDirection: Axis.vertical,
    windowWidth: 1560,
    barPadding: const AppEdgeInsets.large(vertical: AppEdgeInsets.xLargeValue),
    isTransparentBody: false
  );

  @override
  _State createState() => _State();
}

class _State extends AppViewerState<AppProjectViewer> {
  @override
  Widget buildBar(bool showBackground) {
    final AppTheme theme = context.appLayout.theme;

    final TextStyle titleStyle = showBackground
      ? theme.header2OverElement1Color1BoldStyle
      : theme.header2OverBackgroundColor1BoldStyle;

    final TextStyle descriptionStyle = showBackground
      ? theme.text1OverElement1Color1Style
      : theme.text1OverBackgroundColor1Style;

    return Row(
      spacing: AppLayout.normalSpacing,
      children: [
        Icon(AppIcons.webhook, size: 64, color: titleStyle.color),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.project.title, style: titleStyle),
              Text(widget.project.description, style: descriptionStyle)
            ]
          )
        ),
        AppButton.icon(
          icon: AppIcons.close,
          color: titleStyle.color!,
          onPressed: () => Navigator.pop(context)
        )
      ]
    );
  }

  @override
  Widget buildBody(double width, double height) {
    final AppTheme theme = context.appLayout.theme;
    int widgetPlaceholderIndex = 0;
    final List<Widget> children = [];
    final List<Widget> placeholderWidgets = widget.project.buildPlaceholderWidgets();
    final List<String> infoLines = widget.project.info.split(Strings.splitTag);

    for (String infoLine in infoLines) {
      if (infoLine == Strings.widgetTag) {
        children.add(placeholderWidgets[widgetPlaceholderIndex]);
        children.add(AppLayout.normalVerticalSpacer);
        widgetPlaceholderIndex++;
      }
      else if (infoLine.startsWith(Strings.titleTag)) {
        infoLine = infoLine.replaceAll(Strings.titleTag, '');
        children.add(
          Text(infoLine, style: theme.text1OverBackgroundColor1BoldStyle)
        );
        children.add(AppLayout.smallVerticalSpacer);
      }
      else if (infoLine.isNotEmpty) {
        infoLine = infoLine.replaceAll('\n▪', '\n    ▪');
        children.add(
          Text(infoLine, style: theme.text1OverBackgroundColor1Style)
        );
        children.add(AppLayout.normalVerticalSpacer);
      }
    }

    return AppScrollView(
      padding: const AppEdgeInsets.normal(bottom: AppEdgeInsets.xLargeValue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children
      )
    );
  }
}