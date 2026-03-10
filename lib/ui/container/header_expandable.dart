import 'package:flutter/material.dart';

import '../button.dart';
import '../const.dart';
import 'container.dart';
import 'expandable.dart';

class AppHeaderExpandable extends StatefulWidget {
  final bool startOpen;
  final Color arrowColor;
  final bool isClipped;
  final EdgeInsets headerContentPadding;
  final EdgeInsets? fixedContentPadding;
  final EdgeInsets expandableContentPadding;
  final Widget headerContent;
  final Widget? fixedContent;
  final Widget expandableContent;

  AppHeaderExpandable({
    this.startOpen = false,
    required this.arrowColor,
    this.isClipped = false,
    required this.headerContentPadding,
    this.fixedContentPadding,
    required this.expandableContentPadding,
    required this.headerContent,
    this.fixedContent,
    required this.expandableContent
  });

  @override
  _State createState() => _State(startOpen);
}

class _State extends State<AppHeaderExpandable> {
  final AppExpandableKey expandableKey;

  _State(bool startOpen) : expandableKey = AppExpandableKey(startOpen);

  @override
  Widget build(BuildContext context) {
    Widget? fixedContent = widget.fixedContent;

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
          child: AppInkResponse(
            padding: widget.headerContentPadding,
            effectsColor: AppButton.effectsColor,
            onPressed: onPressed,
            child: Row(
              spacing: 16,
              children: [
                Expanded(
                  child: widget.headerContent
                ),
                Icon(
                  expandableKey.isExpanded ? AppIcons.arrowUp : AppIcons.arrowDown,
                  color: widget.arrowColor
                )
              ]
            )
          )
        ),

        if (fixedContent != null)
          fixedContent,

        AppExpandable(
          key: expandableKey,
          padding: widget.expandableContentPadding,
          isClipped: widget.isClipped,
          child: widget.expandableContent
        )
      ]
    );
  }

  void onPressed() {
    setState(() => expandableKey.switchExpandedState());
  }
}