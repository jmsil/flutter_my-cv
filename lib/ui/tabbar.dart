import 'package:flutter/material.dart';

import 'layout/dimens.dart';
import 'layout/icons.dart';
import 'layout/layout_model.dart';
import 'strings/strings_model.dart';
import 'text.dart';

class AppTabBar extends StatelessWidget {
  final List<AppTabBarTab> tabs;
  final List<Widget> pages;

  AppTabBar({
    required this.tabs,
    required this.pages
  });

  AppTabBar.summaryPortfolio({
    required Widget summaryPage,
    required Widget portfolioPage
  }) : this(
    tabs: [
      AppTabBarTab(AppIcons.summary, StringsModel.strings.summary),
      AppTabBarTab(AppIcons.briefcase, StringsModel.strings.portfolio)
    ],
    pages: [
      summaryPage,
      portfolioPage
    ]
  );

  @override
  Widget build(BuildContext context) {
    final AppThemeDataStyledProperty themeProperty =
      LayoutModel.theme.background.overStyled1;
    final List<Widget> builtTabs = [];

    for (AppTabBarTab tab in tabs) {
      Widget widget = AppIconText(
        icon: tab.icon, text: tab.label,
        textStyle: themeProperty.normalHeader.bold,
        enableOverflow: true
      );
      builtTabs.add(widget);
    }

    return DefaultTabController(
      length: tabs.length,
      animationDuration: AppTheme.animationDuration,
      child: Column(
        spacing: AppDimens.large,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
            dividerHeight: 0,
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: themeProperty.color.withDividerAlpha,
            labelPadding: const AppEdgeInsets.small(),
            overlayColor: WidgetStateProperty.resolveWith(
              (_) => themeProperty.effectColor.withInkEffectAlpha
            ),
            tabs: builtTabs
          ),
          _TabBarView(pages)
        ]
      )
    );
  }
}

class _TabBarView extends StatefulWidget {
  final List<Widget> pages;

  _TabBarView(this.pages);

  @override
  _TabBarViewState createState() => _TabBarViewState();
}

class _TabBarViewState extends State<_TabBarView> {
  TabController? controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    TabController newController = DefaultTabController.of(context);

    if (newController != controller) {
      controller?.removeListener(controllerListener);
      controller = newController;
      controller?.addListener(controllerListener);
    }
  }

  @override
  void dispose() {
    controller?.removeListener(controllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: Alignment.topCenter,
      curve: AppTheme.animationCurve,
      duration: AppTheme.animationDuration,
      child: widget.pages[controller?.index ?? 0]
    );
  }

  void controllerListener() {
    setState(() {});
  }
}

class AppTabBarTab {
  final IconData icon;
  final String label;

  AppTabBarTab(this.icon, this.label);
}