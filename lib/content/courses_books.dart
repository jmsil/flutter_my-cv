import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/strings.dart';
import '../ui/theme.dart';
import 'group.dart';

class CoursesAndBooksGroup extends StatelessWidget {
  final List<Widget> _children = [];

  @override
  Widget build(BuildContext context) {
    _addChild(
      "Clean Architecture - A Craftsman's Guide to Software structure and Design",
      'Robert C. Martin',
      false, true
    );

    _addChild(
      'Clean Code - A Handbook of Agile Sortware Craftsmanship',
      'Robert C. Martin',
      false, true
    );

    _addChild(AppStrings.courseOracleOcaOcpTitle, '2010', true, false);

    return ContentGroup(
      icon: AppIcons.studying,
      title: AppStrings.coursesAndBooksTitle,
      children: _children
    );
  }

  _addChild(String title, String detail, bool isCourse, bool addSeparator) {
    final Widget child = Row(
      children: [
        Icon(isCourse ? AppIcons.course : AppIcons.book, color: AppTheme.darkColor),
        AppUiConst.hsep8,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title, style: AppTheme.darkBoldStyle,
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
              Text(detail, style: AppTheme.darkItalicStyle)
            ]
          )
        )
      ]
    );
    _children.add(child);

    if (addSeparator)
      _children.add(AppUiConst.vsep16);
  }
}