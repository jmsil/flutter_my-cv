import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/json.dart';
import 'package:re_highlight/languages/xml.dart';
import 'package:re_highlight/styles/vs2015.dart';

import '../container/container.dart';
import '../theme.dart';

class ProjectCodeWidget extends AppContainer {
  ProjectCodeWidget(Uint8List fromCode, Uint8List toCode, bool hasTopMargin, bool hasBottomMargin)
    : super(
        height: 306,
        color: AppTheme.highDarkColor,
        margin: EdgeInsets.only(
          top: hasTopMargin ? AppTheme.normalSpacingValue : 0,
          bottom: hasBottomMargin ? AppTheme.xLargeSpacingValue : 0
        ),
        borderRadius: AppTheme.allBorderRadius,
        child: Row(
          children: [
            Expanded(child: _Editor(fromCode)),
            VerticalDivider(
              thickness: 64, width: 64,
              color: AppTheme.lowLightColor.withValues(alpha: 0.06)
            ),
            Expanded(child: _Editor(toCode))
          ]
        )
      );
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