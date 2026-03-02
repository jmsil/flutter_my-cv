import 'package:flutter/material.dart';
import 'package:my_cv/content/profile_photo.dart';

import '../ui/assets.dart';
import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/strings.dart';
import '../ui/theme.dart';

class MobileAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: AppTheme.highDarkColor,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 32,
            children: [
              SizedBox(
                height: 110,
                child: ProfilePhoto(false)
              ),
              _ProfileDetails(true)
            ]
          ),
          _Divider(2),
          Text(AppStrings.professionalSummaryText, style: AppTheme.largeLightBlueStyle)
        ]
      )
    );
  }
}


class DesktopAppbar extends StatelessWidget {
  static final double verticalSpace = _size + _margin.vertical;
  static const double _size = 230;
  static const EdgeInsets _margin = EdgeInsets.fromLTRB(16, 16, 0, 16);

  @override
  Widget build(BuildContext context) {
    final Widget professionalSummary = Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.professionalSummaryTitle, style: AppTheme.xxLargeLightBlueBoldStyle),
        _Divider(4),
        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(AppStrings.professionalSummaryText, style: AppTheme.xLargeLightBlueStyle)
          )
        )
      ]
    );

    return AppContainer(
      height: _size,
      color: AppTheme.highDarkColor,
      margin: _margin,
      borderRadius: const BorderRadius.horizontal(
        left: const Radius.circular(_size / 2),
        right: const Radius.circular(AppTheme.radiusValue)
      ),
      hasShadow: true,
      isClipped: true,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: Image.asset(AppAssets.background, fit: BoxFit.cover)
          ),
          Row(
            children: [
              ProfilePhoto(true),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 36, 24, 36),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1, child: const SizedBox()
                      ),

                      _ProfileDetails(false),

                      Expanded(
                        flex: 2, child: const SizedBox()
                      ),

                      Expanded(
                        flex: 16,
                        child: professionalSummary
                      )
                    ]
                  )
                )
              )
            ]
          )
        ]
      )
    );
  }
}


class _Divider extends Divider {
  _Divider(double thickness)
    : super(
        thickness: thickness,
        color: AppTheme.lightBlue.withValues(alpha: 0.24),
        radius: AppUiConst.circleBorderRadius
      );
}


class _ProfileDetails extends StatelessWidget {
  final bool isMobileScaffold;

  _ProfileDetails(this.isMobileScaffold);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = isMobileScaffold
      ? AppTheme.lightBlueStyle
      : AppTheme.xLargeLightBlueStyle;
    final Widget flutterRole  = Text(AppStrings.flutterRole, style: textStyle);
    final Widget integrationRole = Text(AppStrings.integrationRole, style: textStyle);

    final List<Widget> children = [
      Text(
        AppStrings.personalName,
        style: isMobileScaffold
          ? AppTheme.largeLightBlueBoldStyle
          : AppTheme.xxLargeLightBlueBoldStyle
      ),
      SizedBox(
        width: isMobileScaffold ? 140 : 180,
        child: _Divider(4),
      )
    ];

    if (isMobileScaffold) {
      children.add(flutterRole);
      children.add(integrationRole);
    }
    else {
      Widget roles = Expanded(
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            flutterRole,
            integrationRole
          ]
        )
      );
      children.add(roles);
    }

    return Column(
      spacing: isMobileScaffold ? 4 : 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
    );
  }
}