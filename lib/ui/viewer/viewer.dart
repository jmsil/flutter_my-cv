import 'package:flutter/material.dart';

class AppViewer {
  static void show(BuildContext context, Widget viewer) {
    showGeneralDialog<void>(
      context: context,
      barrierLabel: '',
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.56),
      transitionDuration: const Duration(milliseconds: 380),

      transitionBuilder: (transCtx, transAnim, transSecAnim, transChild) {
        return FadeUpwardsPageTransitionsBuilder().buildTransitions(
          null, transCtx, transAnim, transSecAnim, transChild
        );
      },

      pageBuilder: (pageCtx, pageAnim, pageSecAnim) {
        return viewer;
      }
    );
  }
}