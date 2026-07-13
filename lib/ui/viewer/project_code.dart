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
import '../const.dart';
import '../container/container.dart';
import '../hover.dart';
import '../theme.dart';
import 'viewer.dart';

class ProjectCodeWidget extends StatelessWidget {
  final AppViewerKey viewerKey;
  final AssetsArchive assets;
  final List<int> assetsIds;
  final List<int> flexes;

  ProjectCodeWidget(this.viewerKey, this.assets, this.assetsIds, [this.flexes = const []]);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

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

    final Widget child = AppContainer(
      color: AppTheme.highDarkColor,
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

  Widget _hoverBuilder(bool hovered, Widget? child) {
    final List<Widget> children = [child!];

    if (hovered) {
      Widget fullscreenButton = Padding(
        padding: const ThemedEdgeInsets.normal(),
        child: AppButton.icon(
          icon: viewerKey.isInFullscreen ? AppIcons.fullScreenExit : AppIcons.fullscreen,
          onPressed: () => _fullscreenPressed(child)
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

  void _fullscreenPressed(Widget hoverChild) {
    Widget? fullscreenWidget = viewerKey.isInFullscreen
      ? null
      : AppHoverWidget(
          child: hoverChild,
          builder: _hoverBuilder
        );
    viewerKey.setFullscreenWidget(fullscreenWidget);
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

        leadingDivider: VerticalDivider(
          width: 1,
          color: AppTheme.lowLightColor.withValues(alpha: 0.32)
        )
      );
}