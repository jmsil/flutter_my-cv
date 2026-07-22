import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/groovy.dart';
import 'package:re_highlight/languages/json.dart';
import 'package:re_highlight/languages/xml.dart';
import 'package:re_highlight/styles/vs2015.dart';

import '../assets.dart';
import '../button/button.dart';
import '../container/container.dart';
import '../hover.dart';
import '../layout/edge_insets.dart';
import '../layout/icons.dart';
import '../layout/layout_provider.dart';
import 'viewer.dart';

class ProjectCodeWidget extends StatelessWidget {
  final AssetsArchive assets;
  final List<int> assetsIds;
  final List<int> flexes;

  ProjectCodeWidget(this.assets, this.assetsIds, [this.flexes = const []]);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.appLayout.theme;
    final List<Widget> children = [];

    for (int id in assetsIds) {
      Widget editorWidget = Expanded(
        flex: flexes.isEmpty ? 1 : flexes[assetsIds.indexOf(id)],
        child: _Editor(theme, assets.getFile(id))
      );
      Widget dividerWidget = VerticalDivider(
        thickness: 48, width: 48,
        color: theme.elementColor3.withValues(alpha: 0.06)
      );
      children.add(editorWidget);
      children.add(dividerWidget);
    }

    children.removeLast();

    final Widget child = AppContainer(
      color: theme.elementColor1,
      borderRadius: AppTheme.allBorderRadius,
      child: Row(children: children)
    );

    return SizedBox(
      height: 326,
      child: AppHoverWidget(
        child: child,
        builder: _hoverBuilder
      )
    );
  }

  Widget _hoverBuilder(BuildContext context, bool hovered, Widget? child) {
    final AppTheme theme = context.appLayout.theme;
    final isInFullScreenMode = AppViewer.isInFullScreenOf(context);
    final List<Widget> children = [ child! ];

    if (hovered) {
      Widget fullscreenButton = Padding(
        padding: const AppEdgeInsets.normal(),
        child: AppButton.icon(
          icon: isInFullScreenMode ? AppIcons.fullScreenExit : AppIcons.fullscreen,
          color: theme.overElement1Color1,
          onPressed: () => _fullScreenPressed(context, isInFullScreenMode, child)
        )
      );
      children.add(fullscreenButton);
    }

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: children
    );
  }

  void _fullScreenPressed(BuildContext context, bool isInFullScreenMode, Widget child) {
    Widget? widget = isInFullScreenMode
      ? null
      : AppHoverWidget(
          child: child,
          builder: _hoverBuilder
        );
    AppViewer.setFullScreenOf(context, widget);
  }
}

class _Editor extends CodeEditor {
  _Editor(AppTheme theme, Uint8List code)
    : super(
        readOnly: true,

        controller: CodeLineEditingController.fromText(
          utf8.decode(code)
        ),

        style: CodeEditorStyle(
          fontSize: theme.text1FontSize,
          textColor: theme.backgroundColor,
          cursorColor: theme.backgroundColor,
          selectionColor: theme.elementColor3.withValues(alpha: 0.25),
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
            padding: const AppEdgeInsets.normal(vertical: 0),
            child: DefaultCodeLineNumber(
              controller: editingController,
              notifier: notifier,
            )
          );
        },

        leadingDivider: VerticalDivider(
          width: 1,
          color: theme.elementColor3.withValues(alpha: 0.32)
        )
      );
}