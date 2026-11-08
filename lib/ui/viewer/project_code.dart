import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/groovy.dart';
import 'package:re_highlight/languages/json.dart';
import 'package:re_highlight/languages/xml.dart';
import 'package:re_highlight/styles/vs2015.dart';

import '../../scaffold/device.dart';
import '../assets.dart';
import '../layout/dimens.dart';
import '../layout/layout_model.dart';
import 'full_window_handler.dart';

class ProjectCodeWidget extends StatefulWidget {
  final AssetsArchive assets;
  final List<int> assetsIds;
  final List<int>? horizontalFlexes;

  ProjectCodeWidget(this.assets, this.assetsIds, [this.horizontalFlexes]);

  @override
  _State createState() => _State();
}

class _State extends State<ProjectCodeWidget> {
  final List<CodeLineEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    for (int id in widget.assetsIds) {
      controllers.add(CodeLineEditingController.fromText(
        utf8.decode(widget.assets.getFile(id))
      ));
    }
  }

  @override
  void dispose() {
    for (CodeLineEditingController controller in controllers)
      controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    final double screenWidth = context.screenSize.width;
    final List<Widget> children = [];

    final bool isHorizontalDirection =
      widget.assetsIds.length == 1 ||
      screenWidth / widget.assetsIds.length >= 400;

    for (int i = 0; i < widget.assetsIds.length; i++) {
      Widget editorWidget = _CodeEditor(theme, controllers[i]);
      children.add(isHorizontalDirection
        ? Expanded(
            flex: widget.horizontalFlexes?[i] ?? 1,
            child: editorWidget
          )
        : _FullWindowHandler(
            theme,
            editorWidget,
            _FullWindowHandler(theme, editorWidget, null)
          )
      );
    }

    final Widget builtWidget = Flex(
      direction: isHorizontalDirection ? Axis.horizontal : Axis.vertical,
      spacing: AppDimens.normal,
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
  _CodeEditor(
    AppTheme theme, CodeLineEditingController controller
  ) : super(
    readOnly: true,
    wordWrap: false,
    borderRadius: AppTheme.allBorderRadius,
    controller: controller,
    style: CodeEditorStyle(
      fontSize: theme.background.overStyled1.normalText.regular.fontSize,
      textColor: theme.background.surfaceColor,
      cursorColor: theme.background.surfaceColor,
      backgroundColor: theme.brand1.surfaceColor,
      selectionColor: theme.brand1.over1.color.withTextSelectionAlpha,
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
          left: AppDimens.small,
          right: AppDimens.normal
        ),
        child: DefaultCodeLineNumber(
          controller: editingController,
          notifier: notifier
        )
      );
    },
    leadingDivider: VerticalDivider(
      width: 1.5, thickness: 1.5,
      color: theme.brand2.over2.color.withDividerAlpha
    )
  );
}

class _FullWindowHandler extends SizedBox {
  _FullWindowHandler(
    AppTheme theme, Widget child, Widget? fullWindowChild
  ) : super(
    height: 326,
    child: AppViewerFullWindowHandler(
      iconColor: theme.brand1.over1.color,
      child: child,
      fullWindowChild: fullWindowChild
    )
  );
}