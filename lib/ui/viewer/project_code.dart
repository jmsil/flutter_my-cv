import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/json.dart';
import 'package:re_highlight/languages/xml.dart';
import 'package:re_highlight/styles/vs2015.dart';

import '../container/container.dart';
import '../theme.dart';

class ProjectCodeWidget extends AppContainer {
  ProjectCodeWidget({
    required String fromCode,
    required String toCode,
    required bool hasTopMargin
  })
    : super(
        height: 300,
        color: AppTheme.highDarkColor,
        padding: const EdgeInsets.symmetric(vertical: ThemedEdgeInsets.normalValue),
        margin: EdgeInsets.only(
          top: hasTopMargin ? AppTheme.xLargeSpacingValue : 0,
          bottom: AppTheme.xLargeSpacingValue
        ),
        borderRadius: AppTheme.allBorderRadius,
        child: Row(
          children: [
            Expanded(child: _Editor(fromCode)),
            Expanded(child: _Editor(toCode))
          ]
        )
      );
}


class _Editor extends CodeEditor {
  _Editor(String code)
    : super(
        controller: CodeLineEditingController.fromText(code),
        readOnly: true,

        style: CodeEditorStyle(
          fontSize: AppTheme.normalFontSize,
          textColor: AppTheme.highLightColor,
          cursorColor: AppTheme.lowLightColor,
          selectionColor: AppTheme.lowLightColor.withValues(alpha: 0.25),
          codeTheme: CodeHighlightTheme(
            languages: {
              'xml': CodeHighlightThemeMode(mode: langXml),
              'json': CodeHighlightThemeMode(mode: langJson)
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