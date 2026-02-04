import 'package:flutter/material.dart';

import '../const.dart';
import '../theme.dart';
import 'container.dart';
import 'expandable.dart';

class AppHeaderExpandable extends StatefulWidget {
  final Widget headerContent;
  final Widget? fixedContent;
  final Widget expandableContent;

  AppHeaderExpandable({
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
    final effectsColor = AppTheme.lowLightColor.withValues(alpha: 0.32);

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
              padding: AppExpandable.padding,
              child: Row(
                children: [
                  Expanded(
                    child: widget.headerContent
                  ),
                  AppUiConst.hsep16,
                  Icon(
                    expandableKey.isExpanded ? AppIcons.arrow_up : AppIcons.arrow_down,
                    color: AppTheme.darkBlue
                  )
                ]
              )
            )
          )
        ),

        if (widget.fixedContent != null)
          Padding(
            padding: AppExpandable.padding,
            child: widget.fixedContent
          ),

        AppExpandable(expandableKey, widget.expandableContent)
      ]
    );
  }
}