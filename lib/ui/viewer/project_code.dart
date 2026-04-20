import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/groovy.dart';
import 'package:re_highlight/languages/json.dart';
import 'package:re_highlight/languages/xml.dart';
import 'package:re_highlight/styles/vs2015.dart';

import '../assets.dart';
import '../container/container.dart';
import '../theme.dart';

class ProjectCodeWidget extends StatelessWidget {
  final AssetsArchive assets;
  final List<int> assetsIds;
  final List<int> flexes;

  ProjectCodeWidget(this.assets, this.assetsIds, [this.flexes = const []]);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int id in assetsIds) {
      Widget editorWidget = Expanded(
        flex: flexes.isEmpty ? 1 : flexes[assetsIds.indexOf(id)],
        child: _Editor(assets.getFile(id))
      );
      Widget dividerWidget = VerticalDivider(
        thickness: 48, width: 48,
        color: AppTheme.lowLightColor.withValues(alpha: 0.06)
      );
      children.add(editorWidget);
      children.add(dividerWidget);
    }

    children.removeLast();

    return AppContainer(
      height: 326,
      color: AppTheme.highDarkColor,
      borderRadius: AppTheme.allBorderRadius,
      child: Row(children: children)
    );
  }
}


class _Editor extends CodeEditor {
  _Editor(Uint8List code)
    : super(
        readOnly: true,

        controller: CodeLineEditingController.fromText(
          utf8.decode(code)
        ),

        style: CodeEditorStyle(
          fontSize: AppTheme.normalFontSize,
          textColor: AppTheme.highLightColor,
          cursorColor: AppTheme.highLightColor,
          selectionColor: AppTheme.lowLightColor.withValues(alpha: 0.25),
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
            padding: const EdgeInsets.symmetric(horizontal: ThemedEdgeInsets.normalValue),
            child: DefaultCodeLineNumber(
              controller: editingController,
              notifier: notifier,
            )
          );
        },

        sperator: VerticalDivider(
          width: 1,
          color: AppTheme.lowLightColor.withValues(alpha: 0.5)
        )
      );
}