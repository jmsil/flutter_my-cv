import 'package:material_ui/material_ui.dart';

import '../layout/dimens.dart';
import '../layout/icons.dart';
import '../layout/layout_model.dart';
import 'button.dart';

class AppPopupMenuButton extends MenuAnchor {
  AppPopupMenuButton({
    required AppThemeData themeData,
    required List<Widget> children
  }) : super(
    animated: true,
    consumeOutsideTap: true,
    alignmentOffset: const Offset(80, -60),
    style: MenuStyle(
      padding: WidgetStateProperty.resolveWith((_) => const AppEdgeInsets.large()),
      backgroundColor: WidgetStateProperty.resolveWith((_) => themeData.surfaceColor1),
      elevation: WidgetStateProperty.resolveWith((_) => 8),
      shadowColor: WidgetStateProperty.resolveWith((_) => Colors.black54),
      mouseCursor: WidgetStateProperty.resolveWith((_) => SystemMouseCursors.basic),
      shape: WidgetStateProperty.resolveWith((_) => RoundedRectangleBorder(
        borderRadius: AppTheme.allBorderRadius,
        side: BorderSide(width: 1, color: themeData.accent1.color.withWindowBorderAlpha)
      ))
    ),
    builder: (BuildContext context, MenuController controller, Widget? child) {
      final LayoutMode layoutMode = LayoutModel.layoutMode;
      final AppTheme theme = LayoutModel.theme;
      return AppButton.icon(
        icon: AppIcons.settings,
        themeProperty: layoutMode.showSidebarBackground
          ? theme.appbar.over1
          : theme.background.over1,
        onPressed: controller.open
      );
    },
    menuChildren: children
  );

  static void performAction(BuildContext context, VoidCallback action) {
    MenuController.maybeOf(context)?.close();
    Future.delayed(const Duration(milliseconds: 150), action);
  }
}