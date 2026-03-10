import 'package:flutter/material.dart';

class AppExpandable extends StatefulWidget {
  final EdgeInsets padding;
  final bool isClipped;
  final Widget child;

  AppExpandable({
    required AppExpandableKey key,
    required this.padding,
    this.isClipped = false,
    required this.child
  })
    : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<AppExpandable> with SingleTickerProviderStateMixin {
  late bool isOffstage;
  late bool isExpanded;
  double contentHeight = 0;
  final GlobalKey contentKey = GlobalKey();
  late final AnimationController controller;
  late final CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();

    final bool startOpen = (widget.key as AppExpandableKey).startOpen;

    isOffstage = !startOpen;
    isExpanded = startOpen;

    controller = AnimationController(vsync: this);
    controller.addStatusListener(animationStatusListener);

    if (startOpen)
      controller.animateTo(1, duration: Duration.zero);

    curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
      reverseCurve: Curves.decelerate.flipped
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget newChild = Padding(
      padding: widget.padding,
      child: widget.child
    );

    if (widget.isClipped)
      newChild = ClipRect(child: newChild);

    return Offstage(
      offstage: isOffstage,
      child: AnimatedBuilder(
        animation: curvedAnimation,
        builder: (context, child) {
          return ConstrainedBox(
            key: contentKey,
            constraints: BoxConstraints(
              maxHeight: controller.isAnimating
                ? contentHeight * curvedAnimation.value
                : double.infinity
            ),
            child: child
          );
        },
        child: newChild
      )
    );
  }

  void switchExpandedState() {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      isOffstage = false;
      isExpanded = !isExpanded;

      if (!controller.isAnimating) {
        contentHeight = contentKey.currentContext!.size!.height;
        controller.duration = Duration(milliseconds: 360 + (contentHeight * 0.4).toInt());
      }

      if (isExpanded)
        controller.forward();
      else
        controller.reverse();
    });
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.dismissed)
      setState(() => isOffstage = true);
  }
}

class AppExpandableKey extends GlobalKey {
  final bool startOpen;

  AppExpandableKey(this.startOpen) : super.constructor();

  _State? get _state => currentState as _State?;

  void switchExpandedState() => _state?.switchExpandedState();

  bool get isExpanded => _state?.isExpanded ?? startOpen;
}