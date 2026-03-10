import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/container/header_expandable.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import '../ui/theme.dart';
import 'group.dart';

class CoursesAndBooksGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> coursesChildren = [
      _Item(AppStrings.courseSapAdvancedEventMeshTitle, AppStrings.coursesSapDetail),
      _Item(AppStrings.courseSapApiManagementTitle, AppStrings.coursesSapDetail),
      _Item(AppStrings.courseSapCloudIntegration20Title, AppStrings.coursesSapDetail),
      _Item(AppStrings.courseSapCloudIntegrationImmersionTitle, AppStrings.coursesSapDetail),
      _Item(AppStrings.courseOracleTitle, AppStrings.courseOracleDetail)
    ];

    final List<Widget> booksChildren = [
      _Item(
        AppStrings.bookEnterpriseIntegrationPatternsTitle,
        AppStrings.bookEnterpriseIntegrationPatternsDetail
      ),
      _Item(AppStrings.bookCleanArchitectureTitle, AppStrings.booksCleanCodeArchDetail),
      _Item(AppStrings.bookCleanCodeTitle, AppStrings.booksCleanCodeArchDetail),
      _Item(AppStrings.bookGoogleAndroidTitle, AppStrings.bookGoogleAndroidDetail),
      _Item(AppStrings.bookDelphiBibleTitle, AppStrings.bookDelphiBibleDetail)
    ];

    return ContentGroup(
      icon: AppIcons.studying,
      title: AppStrings.coursesAndBooksTitle,
      withPadding: false,
      scrollable: false,
      children: [
        _Expandable(
          AppIcons.course,
          AppStrings.coursesTitle,
          AppIconText(
            AppIcons.link, AppStrings.mooviEducationSite, false, true
          ),
          coursesChildren
        ),
        AppTheme.smallVerticalSpacing,
        _Expandable(
          AppIcons.book, AppStrings.booksTitle, null, booksChildren
        )
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
            AppIcons.arrowRight,
            color: AppTheme.darkColor
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, style: AppTheme.darkBoldStyle,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis
                ),
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
        arrowColor: AppTheme.darkBlue,
        isClipped: true,
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