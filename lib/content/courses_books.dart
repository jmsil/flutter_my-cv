import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/container/header_expandable.dart';
import '../ui/strings/strings.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/theme.dart';
import 'group.dart';

class CoursesAndBooksGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget coursesWidget = _Expandable(
      AppIcons.course,
      StringsProvider.strings.coursesTitle,
      null,
      [
        _Item(Strings.courseSapAdvancedEventMeshTitle, 'Moovi Education ▪ 2025'),
        _Item(Strings.courseSapApiManagementTitle, 'Moovi Education ▪ 2025'),
        _Item(Strings.courseSapCloudIntegration20Title, 'Moovi Education ▪ 2025'),
        _Item(
          StringsProvider.strings.courseSapCloudIntegrationImmersionTitle,
          StringsProvider.strings.courseSapCloudIntegrationImmersionDetail
        ),
        _Item(StringsProvider.strings.courseOracleTitle, Strings.courseOracleDetail)
      ]
    );

    final Widget booksWidget = _Expandable(
      AppIcons.book,
      StringsProvider.strings.booksTitle,
      null,
      [
        _Item(
          Strings.bookEnterpriseIntegrationPatternsTitle,
          Strings.bookEnterpriseIntegrationPatternsDetail
        ),
        _Item(Strings.bookCleanArchitectureTitle, Strings.booksCleanCodeArchDetail),
        _Item(Strings.bookCleanCodeTitle, Strings.booksCleanCodeArchDetail),
        _Item(StringsProvider.strings.bookGoogleAndroidTitle, Strings.bookGoogleAndroidDetail),
        _Item(StringsProvider.strings.bookDelphiBibleTitle, Strings.bookDelphiBibleDetail)
      ]
    );

    return SliverContentGroup(
      icon: AppIcons.studying,
      title: StringsProvider.strings.coursesAndBooksTitle,
      hasHorizontalPadding: false,
      children: [
        coursesWidget,
        AppTheme.smallVerticalSpacing,
        booksWidget
      ]
    );
  }
}

class _Item extends Row {
  _Item(String title, String detail)
    : super(
        spacing: AppTheme.smallSpacingValue,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            AppIcons.topicMark,
            color: AppTheme.darkColor
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTheme.darkBoldStyle),
                Text(detail, style: AppTheme.darkItalicStyle)
              ]
            )
          )
        ]
      );
}

class _Expandable extends AppHeaderExpandable {
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: ThemedEdgeInsets.normalValue, vertical: ThemedEdgeInsets.smallValue
  );

  _Expandable(IconData icon, String title, Widget? fixedContent, List<Widget> children)
    : super(
        isClipped: true,
        arrowColor: AppTheme.darkBlue,
        headerContentPadding: _padding,
        fixedContentPadding: _padding,
        expandableContentPadding: _padding,
        headerContent: Row(
          spacing: AppTheme.smallSpacingValue,
          children: [
            Icon(
              icon,
              size: 32,
              color: AppTheme.darkColor
            ),
            Expanded(
              child: Text(title, style: AppTheme.largeDarkBoldStyle)
            )
          ]
        ),
        fixedContent: fixedContent,
        expandableContent: Column(
          spacing: AppTheme.normalSpacingValue,
          children: children
        )
      );
}