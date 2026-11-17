import 'package:material_ui/material_ui.dart';

import 'appbar/appbar_compact.dart';
import 'scaffold_groups.dart';
import 'sidebar/sidebar.dart';

class AppScaffoldCompact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<DrawerControllerState> drawerKey = GlobalObjectKey('app-scaffold-compact');
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppScaffoldGroupsView(
          AppbarCompact(drawerKey)
        ),
        DrawerController(
          key: drawerKey,
          alignment: DrawerAlignment.start,
          child: AppSidebar()
        )
      ]
    );
  }
}