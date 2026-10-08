import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/groovy.dart';
import 'package:re_highlight/languages/json.dart';
import 'package:re_highlight/languages/xml.dart';
import 'package:re_highlight/styles/vs2015.dart';

import '../../scaffold/device.dart';
import '../assets.dart';
import '../layout/edge_insets.dart';
import '../layout/layout_provider.dart';
import 'full_window_handler.dart';

class ProjectCodeWidget extends StatelessWidget {
  final AssetsArchive assets;
  final List<int> assetsIds;
  final List<int> horizontalFlexes;

  ProjectCodeWidget(this.assets, this.assetsIds, [this.horizontalFlexes = const []]);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    final double screenWidth = context.screenSize.width;
    final List<Widget> children = [];

    final bool isHorizontalDirection =
      assetsIds.length == 1 ||
      screenWidth / assetsIds.length >= 400;

    for (int id in assetsIds) {
      Widget editorWidget = _CodeEditor(theme, assets.getFile(id));
      Widget widget = isHorizontalDirection
        ? Expanded(
            flex: horizontalFlexes.isEmpty ? 1 : horizontalFlexes[assetsIds.indexOf(id)],
            child: editorWidget
          )
        : _FullWindowHandler(
            theme,
            editorWidget,
            _FullWindowHandler(theme, editorWidget, null)
          );
      children.add(widget);
    }

    final Widget builtWidget = Flex(
      direction: isHorizontalDirection ? Axis.horizontal : Axis.vertical,
      spacing: AppLayout.normalSpacing,
      children: children
    );

    return isHorizontalDirection
      ? _FullWindowHandler(
          theme,
          builtWidget,
          _FullWindowHandler(theme, builtWidget, null)
        )
      : builtWidget;
  }
}

class _CodeEditor extends CodeEditor {
  _CodeEditor(AppTheme theme, Uint8List code)
    : super(
        readOnly: true,
        wordWrap: false,
        borderRadius: AppTheme.allBorderRadius,
        controller: CodeLineEditingController.fromText(utf8.decode(code)),
        style: CodeEditorStyle(
          fontSize: theme.text1FontSize,
          textColor: theme.backgroundColor,
          cursorColor: theme.backgroundColor,
          backgroundColor: theme.elementColor1,
          selectionColor: theme.elementColor3.withValues(alpha: 0.32),
          codeTheme: CodeHighlightTheme(
            languages: {
              'xml': CodeHighlightThemeMode(mode: langXml),
              'json': CodeHighlightThemeMode(mode: langJson),
              'groovy': CodeHighlightThemeMode(mode: langGroovy)
            },
            theme: vs2015Theme
          )
        ),
        indicatorBuilder: (context, editingController, chunkController, notifier) {
          return Padding(
            padding: const EdgeInsets.only(
              left: AppEdgeInsets.smallValue,
              right: AppEdgeInsets.normalValue
            ),
            child: DefaultCodeLineNumber(
              controller: editingController,
              notifier: notifier
            )
          );
        },
        leadingDivider: VerticalDivider(
          width: 1,
          color: theme.elementColor3.withValues(alpha: 0.32)
        )
      );
}

class _FullWindowHandler extends SizedBox {
  _FullWindowHandler(
    AppTheme theme, Widget child, Widget? fullWindowChild
  ) : super(
    height: 326,
    child: AppViewerFullWindowHandler(
      iconColor: theme.overElement1Color1,
      child: child,
      fullWindowChild: fullWindowChild
    )
  );
}