import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/groovy.dart';
import 'package:re_highlight/languages/json.dart';
import 'package:re_highlight/languages/xml.dart';
import 'package:re_highlight/styles/vs2015.dart';

import '../assets.dart';
import '../layout/device.dart';
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
    final AppThemeData themeData = LayoutModel.theme.viewer;
    final double screenWidth = context.screenSize.width;
    final List<Widget> children = [];

    final bool isHorizontalDirection =
      widget.assetsIds.length == 1 ||
      screenWidth / widget.assetsIds.length >= 400;

    for (int i = 0; i < widget.assetsIds.length; i++) {
      Widget editorWidget = _CodeEditor(themeData, controllers[i]);
      children.add(isHorizontalDirection
        ? Expanded(
            flex: widget.horizontalFlexes?[i] ?? 1,
            child: editorWidget
          )
        : _FullWindowHandler(
            themeData,
            editorWidget,
            _FullWindowHandler(themeData, editorWidget, null)
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
          themeData,
          builtWidget,
          _FullWindowHandler(themeData, builtWidget, null)
        )
      : builtWidget;
  }
}

class _CodeEditor extends CodeEditor {
  _CodeEditor(
    AppThemeData themeData, CodeLineEditingController controller
  ) : super(
    readOnly: true,
    wordWrap: false,
    borderRadius: AppTheme.allBorderRadius,
    controller: controller,
    style: CodeEditorStyle(
      fontSize: themeData.overStyled1.normalText.regular.fontSize,
      textColor: Colors.white,
      cursorColor: themeData.surfaceColor1,
      backgroundColor: themeData.over2.color,
      selectionColor: themeData.accent2.color.withTextSelectionAlpha,
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
    leadingDivider: Padding(
      padding: const EdgeInsets.only(right: AppDimens.xSmall),
      child: VerticalDivider(
        width: 1, thickness: 1,
        color: themeData.surfaceColor1.withDividerAlpha
      )
    )
  );
}

class _FullWindowHandler extends SizedBox {
  _FullWindowHandler(
    AppThemeData themeData, Widget child, Widget? fullWindowChild
  ) : super(
    height: 326,
    child: AppViewerFullWindowHandler(
      iconColor: themeData.accent2.color,
      child: child,
      fullWindowChild: fullWindowChild
    )
  );
}