import 'package:flutter/material.dart';

import '../const.dart';
import '../theme.dart';
import 'container.dart';
import 'expandable.dart';

class AppHeaderExpandable extends StatefulWidget {
  final bool startOpen;
  final Color arrowColor;
  final EdgeInsets headerContentPadding;
  final EdgeInsets? fixedContentPadding;
  final EdgeInsets expandableContentPadding;
  final Widget headerContent;
  final Widget? fixedContent;
  final Widget expandableContent;

  AppHeaderExpandable({
    this.startOpen = false,
    required this.arrowColor,
    required this.headerContentPadding,
    this.fixedContentPadding,
    required this.expandableContentPadding,
    required this.headerContent,
    this.fixedContent,
    required this.expandableContent
  });

  @override
  _State createState() => _State();
}

class _State extends State<AppHeaderExpandable> {
  final AppExpandableKey expandableKey = AppExpandableKey();

  @override
  Widget build(BuildContext context) {
    Widget? fixedContent = widget.fixedContent;
    final effectsColor = AppTheme.lowLightColor.withValues(alpha: 0.32);

    if (fixedContent != null && widget.fixedContentPadding != null) {
      fixedContent = Padding(
        padding: widget.fixedContentPadding!,
        child: widget.fixedContent
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppContainer(
          child: InkResponse(
            focusColor: Colors.transparent,
            hoverColor: effectsColor,
            splashColor: effectsColor,
            highlightColor: effectsColor,
            highlightShape: BoxShape.rectangle,
            splashFactory: InkRipple.splashFactory,
            mouseCursor: SystemMouseCursors.basic,
            onTap: () => setState(() => expandableKey.switchExpandedState()),
            child: Padding(
              padding: widget.headerContentPadding,
              child: Row(
                children: [
                  Expanded(
                    child: widget.headerContent
                  ),
                  AppUiConst.hsep16,
                  Icon(
                    expandableKey.isExpanded ? AppIcons.arrow_up : AppIcons.arrow_down,
                    color: widget.arrowColor
                  )
                ]
              )
            )
          )
        ),

        if (fixedContent != null)
          fixedContent,

        AppExpandable(
          expandableKey, widget.startOpen,
          widget.expandableContentPadding, widget.expandableContent
        )
      ]
    );
  }
}