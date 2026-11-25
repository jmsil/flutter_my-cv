import 'package:flutter/widgets.dart';

import 'button/ink_response.dart';

class AppHover extends StatefulWidget {
  final Widget? child;
  final Widget Function(BuildContext context, bool hovered, Widget? child) builder;
  final void Function()? onPressed;

  AppHover({
    this.child,
    required this.builder,
    this.onPressed
  });

  @override
  _State createState() => _State();
}

class _State extends State<AppHover> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return AppInkResponse(
      onPressed: widget.onPressed,
      onHover: onHover,
      child: widget.builder(context, hovered, widget.child)
    );
  }

  void onHover(bool value) {
    setState(() => hovered = value);
  }
}