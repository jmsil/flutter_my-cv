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
      false
    );

    _addChild(
      'Clean Code - A Handbook of Agile Sortware Craftsmanship',
      'Robert C. Martin',
      false
    );

    _addChild(AppStrings.courseOracleOcaOcpTitle, '2010', true);

    _children.removeLast();

    return ContentGroup(
      icon: AppIcons.studying,
      title: AppStrings.coursesAndBooksTitle,
      withPadding: true,
      scrollable: false,
      children: _children
    );
  }

  _addChild(String title, String detail, bool isCourse) {
    final Widget child = Row(
      spacing: AppTheme.smallSpacingValue,
      children: [
        Icon(
          isCourse ? AppIcons.course : AppIcons.book,
          size: 32,
          color: AppTheme.darkColor
        ),
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
    _children.add(AppTheme.normalVerticalSpacing);
  }
}