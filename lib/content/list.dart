import 'package:flutter/material.dart';

import '../ui/layout/edge_insets.dart';
import '../ui/layout/icons.dart';
import '../ui/layout/layout_model.dart';
import '../ui/list.dart';
import '../ui/main_group.dart';
import '../ui/strings/strings_model.dart';
import '../ui/text.dart';

class ListGroup extends StatelessWidget {
  final IconData icon;
  final String title;
  final Map<String, List<String>?> list;

  ListGroup.languages() :
    this.icon = AppIcons.language,
    this.title = StringsModel.strings.languagesTitle,
    this.list = StringsModel.strings.languagesInfo;

  ListGroup.availability() :
    this.icon = AppIcons.availability,
    this.title = StringsModel.strings.availabilityTitle,
    this.list = StringsModel.strings.availabilityInfo;

  @override
  Widget build(BuildContext context) {
    final AppThemeData themeData = context.appLayout.theme.background;
    final List<Widget> children = [];

    list.forEach((String listKey, List<String>? listValue) {
      children.add(AppIconText.bullet(text: listKey, textStyle: themeData.normalText.over1.bold));

      if (listValue != null) {
        children.add(AppList(
          list: listValue,
          padding: const AppEdgeInsets.small(left: AppLayout.xLargeSpacing, right: 0),
          themeData: themeData
        ));
      }

      children.add(AppLayout.smallVerticalSpacer);
    });

    children.removeLast();

    return MainGroup.children(
      icon: icon,
      title: title,
      enableBodyHorizontalPadding: true,
      children: children
    );
  }
}