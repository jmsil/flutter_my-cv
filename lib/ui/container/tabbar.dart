import 'package:flutter/material.dart';

import '../layout/edge_insets.dart';
import '../layout/icons.dart';
import '../layout/layout_model.dart';
import '../strings/strings_model.dart';
import '../text.dart';

class AppTabBar extends StatelessWidget {
  final List<AppIconText> tabs;
  final List<Widget> pages;

  AppTabBar({
    required this.tabs,
    required this.pages
  });

  AppTabBar.summaryPortfolio({
    required AppTheme theme,
    required Widget summaryPage,
    required Widget portfolioPage
  }) :
    tabs = [
      AppIconText(
        icon: AppIcons.summary,
        text: StringsModel.strings.summary,
        textStyle: theme.background.normalHeader.over1.bold
      ),
      AppIconText(
        icon: AppIcons.briefcase,
        text: StringsModel.strings.portfolio,
        textStyle: theme.background.normalHeader.over1.bold
      )
    ],
    pages = [
      summaryPage,
      portfolioPage
    ];

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    return DefaultTabController(
      length: tabs.length,
      animationDuration: AppTheme.animationDuration,
      child: Column(
        spacing: AppLayout.largeSpacing,
        children: [
          TabBar(
            dividerHeight: 0,
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: theme.background.overColor1.withValues(alpha: 0.24),
            labelPadding: const AppEdgeInsets.small(),
            overlayColor: WidgetStateColor.resolveWith((_) => theme.inkEffectsColor),
            tabs: tabs,
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
      curve: AppTheme.animationCurve,
      duration: AppTheme.animationDuration,
      child: widget.pages[controller?.index ?? 0]
    );
  }

  void controllerListener() {
    setState(() {});
  }
}