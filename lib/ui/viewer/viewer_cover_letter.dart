import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../pdf/generator.dart';
import '../button/button.dart';
import '../layout/dimens.dart';
import '../layout/icons.dart';
import '../layout/theme.dart';
import '../scroller.dart';
import '../strings/strings_model.dart';
import 'viewer.dart';

class ViewerCoverLetter extends AppViewer {
  final String companyName;
  final String role;
  final List<String> info;

  ViewerCoverLetter({
    required this.companyName,
    required this.role,
    required this.info
  }) : super(
    direction: Axis.vertical,
    width: 800,
    maxBarRatio: 0.18
  );

  @override
  _State createState() => _State();
}

class _State extends AppViewerState<ViewerCoverLetter> {
  @override
  Widget buildBar(AppThemeData themeData, double width, double height) {
    return buildBarUtil(themeData, false, width, height);
  }

  @override
  Widget buildCompactModeBar(AppThemeData themeData, double width, double height) {
    return buildBarUtil(themeData, true, width, height);
  }

  Widget buildBarUtil(AppThemeData themeData, bool isCompactMode, double width, double height) {
    final AppThemeDataStyledProperty themeProperty = themeData.overStyled1;
    return Padding(
      padding: isCompactMode
        ? const AppEdgeInsets.normal()
        : const AppEdgeInsets.large(vertical: AppDimens.xLarge),
      child: Row(
        spacing: AppDimens.normal,
        children: [
          Icon(
            AppIcons.mail,
            size: isCompactMode ? AppDimens.xxLarge : AppDimens.xxxLarge,
            color: themeProperty.color
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: StringsModel.strings.coverLetter + '\n',
                    style: isCompactMode
                      ? themeProperty.normalHeader.bold : themeProperty.largeHeader.bold
                  ),
                  TextSpan(
                    text: widget.role,
                    style: isCompactMode
                      ? themeProperty.normalText.regular : themeProperty.largeText.regular
                  )
                ]
              )
            )
          ),
          AppButton.icon(
            icon: AppIcons.close,
            themeProperty: themeProperty,
            onPressed: () => Navigator.pop(context)
          )
        ]
      )
    );
  }

  @override
  Widget buildBody(AppThemeData themeData, double width, double height) {
    final AppThemeDataStyledProperty themeProperty = themeData.overStyled1;
    return AppListView(
      padding: width < 420
        ? const AppEdgeInsets.normal()
        : width < 640
          ? const AppEdgeInsets.xLarge() : const AppEdgeInsets.xxxLarge(),
      children: [
        Text(widget.info[0], style: themeProperty.normalHeader.bold),
        AppSpacing.xLargeV,
        Text(widget.info[1], style: themeProperty.normalText.regular),
        AppSpacing.xLargeV,
        Text(widget.info[2], style: themeProperty.normalText.italic)
      ]
    );
  }

  @override
  Widget? buildBodyBottomToolbar(AppThemeData themeData, double width) {
    return Padding(
      padding: const AppEdgeInsets.normal(),
      child: Row(
        spacing: AppDimens.normal,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppButton.icon(
            icon: AppIcons.copy,
            themeProperty: themeData.accentStyled1,
            onPressed: onPressedCopy
          ),
          AppButton.icon(
            icon: AppIcons.download,
            themeProperty: themeData.accentStyled1,
            onPressed: onPressedDownload
          )
        ]
      )
    );
  }

  void onPressedCopy() {
    Clipboard.setData(
      ClipboardData(
        text: [
          Strings.personalName,
          StringsModel.strings.roles.replaceAll('\n', Strings.pipeJoiner),
          [
            StringsModel.strings.personalLocation,
            Strings.personalPhone,
            Strings.personalEmail,
            Strings.personalGitHubLink,
            Strings.personalCvLink
          ].join(Strings.pipeJoiner),
          '\n\n',
          widget.info.join('\n\n')
        ].join('\n')
      )
    );
  }

  void onPressedDownload() {
    PdfGenerator.downloadCoverLetter(widget.companyName, widget.info);
  }
}