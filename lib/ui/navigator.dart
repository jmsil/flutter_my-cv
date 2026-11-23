import 'package:material_ui/material_ui.dart';

import 'layout/theme.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> key = GlobalKey();

  static Future<T> show<T>({
    required bool isOpaque,
    required Widget child
  }) async {
    return await key.currentState?.push(
      PageRouteBuilder(
        opaque: isOpaque,
        barrierLabel: '',
        barrierDismissible: true,
        barrierColor: Colors.black.withViewerBackgroundAlpha,
        transitionDuration: AppTheme.animationDuration,
        reverseTransitionDuration: AppTheme.animationDuration,

        transitionsBuilder: (transCtx, transAnim, transSecAnim, transChild) {
          return FadeUpwardsPageTransitionsBuilder().buildTransitions(
            null, transCtx, transAnim, transSecAnim, transChild
          );
        },

        pageBuilder: (pageCtx, pageAnim, pageSecAnim) => child
      )
    );
  }

  static void pop([Object? result]) {
    key.currentState?.pop(result);
  }
}