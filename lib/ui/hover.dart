import 'package:flutter/material.dart';

import 'button/ink_response.dart';

class AppHoverWidget extends StatefulWidget {
  final Widget? child;
  final Widget Function(bool hovered, Widget? child) builder;
  final void Function()? onPressed;

  AppHoverWidget({
    this.child,
    required this.builder,
    this.onPressed
  });

  @override
  _State createState() => _State();
}


class _State extends State<AppHoverWidget> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return AppInkResponse(
      effectsColor: Colors.transparent,
      onPressed: widget.onPressed,
      onHover: onHover,
      child: widget.builder(hovered, widget.child)
    );
  }

  void onHover(bool value) {
    setState(() => hovered = value);
  }
}