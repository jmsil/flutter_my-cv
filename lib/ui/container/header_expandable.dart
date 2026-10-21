import 'package:flutter/material.dart';

import '../button/ink_response.dart';
import '../layout/icons.dart';
import 'container.dart';
import 'expandable.dart';

class AppHeaderExpandable extends StatefulWidget {
  final bool startOpen;
  final Color arrowColor;
  final Color effectColor;
  final bool isClipped;
  final bool isIntrinsicHeader;
  final EdgeInsets headerPadding;
  final EdgeInsets? fixedPadding;
  final EdgeInsets expandablePadding;
  final Widget headerChild;
  final Widget? fixedChild;
  final Widget expandableChild;

  AppHeaderExpandable({
    this.startOpen = false,
    required this.arrowColor,
    required this.effectColor,
    this.isClipped = false,
    this.isIntrinsicHeader = false,
    required this.headerPadding,
    this.fixedPadding,
    required this.expandablePadding,
    required this.headerChild,
    this.fixedChild,
    required this.expandableChild
  });

  @override
  _State createState() => _State(startOpen);
}

class _State extends State<AppHeaderExpandable> {
  final AppExpandableKey expandableKey;

  _State(bool startOpen) : expandableKey = AppExpandableKey(startOpen);

  @override
  Widget build(BuildContext context) {
    Widget builtHeaderChild = AppContainer(
      child: AppInkResponse(
        padding: widget.headerPadding,
        effectColor: widget.effectColor,
        onPressed: onPressed,
        child: Row(
          spacing: 16,
          children: [
            Expanded(
              child: widget.headerChild
            ),
            Icon(
              expandableKey.isExpanded ? AppIcons.arrowUp : AppIcons.arrowDown,
              color: widget.arrowColor
            )
          ]
        )
      )
    );

    if (widget.isIntrinsicHeader) {
      builtHeaderChild = IntrinsicHeight(
        child: builtHeaderChild
      );
    }

    Widget? builtFixedChild = widget.fixedChild;

    if (builtFixedChild != null && widget.fixedPadding != null) {
      builtFixedChild = Padding(
        padding: widget.fixedPadding!,
        child: builtFixedChild
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        builtHeaderChild,

        if (builtFixedChild != null)
          builtFixedChild,

        AppExpandable(
          key: expandableKey,
          padding: widget.expandablePadding,
          isClipped: widget.isClipped,
          child: widget.expandableChild
        )
      ]
    );
  }

  void onPressed() {
    setState(() => expandableKey.switchExpandedState());
  }
}