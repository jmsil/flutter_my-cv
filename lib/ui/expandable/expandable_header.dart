import 'package:flutter/widgets.dart';

import '../button/ink_response.dart';
import '../container.dart';
import '../layout/dimens.dart';
import '../layout/icons.dart';
import 'expandable.dart';

class AppExpandableHeader extends StatefulWidget {
  final bool startOpen;
  final Color arrowColor;
  final Color effectColor;
  final bool enableClip;
  final bool enableIntrinsicHeaderHeight;
  final EdgeInsets headerPadding;
  final EdgeInsets? fixedPadding;
  final EdgeInsets expandablePadding;
  final Widget headerChild;
  final Widget? fixedChild;
  final Widget expandableChild;

  AppExpandableHeader({
    this.startOpen = false,
    required this.arrowColor,
    required this.effectColor,
    this.enableClip = false,
    this.enableIntrinsicHeaderHeight = false,
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

class _State extends State<AppExpandableHeader> {
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
          spacing: AppDimens.normal,
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

    if (widget.enableIntrinsicHeaderHeight)
      builtHeaderChild = IntrinsicHeight(child: builtHeaderChild);

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
          enableClip: widget.enableClip,
          child: widget.expandableChild
        )
      ]
    );
  }

  void onPressed() {
    setState(() => expandableKey.switchExpandedState());
  }
}