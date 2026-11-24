import 'package:material_ui/material_ui.dart';
import 'package:my_cv/ui/button/ink_response.dart';

import '../button/button.dart';
import '../container.dart';
import '../layout/dimens.dart';
import '../layout/icons.dart';
import '../layout/layout_model.dart';
import '../navigator.dart';
import '../strings/strings_model.dart';

class CoverLetterSettingsSelector extends StatefulWidget {
  CoverLetterSettingsSelector._();

  @override
  _State createState() => _State();

  static Future<CoverLetterSettings?> show() {
    return AppNavigator.show(isOpaque: false, child: CoverLetterSettingsSelector._());
  }
}

class _State extends State<CoverLetterSettingsSelector> {
  final TextEditingController controller = TextEditingController();
  final List<String> roles = StringsModel.strings.roles.split('\n');
  int roleIdx = 1;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppThemeData themeData = LayoutModel.theme.background;
    final TextStyle decorationStyle =
      themeData.overStyled1.normalText.regular.withHighDecorationAlpha;

    final Widget builtTextField = TextField(
      controller: controller,
      style: themeData.overStyled1.normalText.regular,
      cursorColor: themeData.over1.color,
      textCapitalization: TextCapitalization.words,
      maxLength: 40,
      decoration: InputDecoration(
        label: Text(StringsModel.strings.company, style: decorationStyle),
        counterStyle: decorationStyle,
        visualDensity: VisualDensity.standard,
        border: WidgetStateInputBorder.resolveWith(
          (_) => UnderlineInputBorder(borderSide: BorderSide(color: themeData.over1.color))
        )
      )
    );

    final Widget builtSapIsRoleSelector = _RoleSelector(
      themeData, roles[1], roleIdx == 1, () => onPressedRoleSelector(1)
    );

    final Widget builtButtons = Row(
      spacing: AppDimens.normal,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppMaterialButton(
          icon: AppIcons.close,
          themeProperty: themeData.accentStyled1,
          onPressed: AppNavigator.pop
        ),
        AppMaterialButton(
          icon: AppIcons.check,
          text: Strings.ok,
          themeProperty: themeData.accentStyled1,
          onPressed: onPressedOk
        )
      ]
    );

    return Center(
      child: AppContainer(
        width: 420,
        color: themeData.surfaceColor1,
        margin: const AppEdgeInsets.normal(),
        padding: const AppEdgeInsets.large(),
        borderColor: themeData.accent1.color.withDecorationAlpha,
        borderRadius: AppTheme.allBorderRadius,
        child: Column(
          spacing: AppDimens.xLarge,
          mainAxisSize: MainAxisSize.min,
          children: [
            builtTextField,
            builtSapIsRoleSelector,
            builtButtons
          ]
        )
      )
    );
  }

  void onPressedRoleSelector(int newRoleIdx) {
    if (newRoleIdx != roleIdx)
      setState(() => roleIdx = newRoleIdx);
  }

  void onPressedOk() {
    final String companyName = controller.text.trim();

    if (companyName.isNotEmpty) {
      AppNavigator.pop(CoverLetterSettings(
        companyName,
        roles[roleIdx],
        roleIdx == 0
          ? []
          : StringsModel.strings.coverLetterSapIsInfo(companyName)
      ));
    }
  }
}

class _RoleSelector extends AppContainer {
  _RoleSelector(
    AppThemeData themeData, String role, bool isSelected, VoidCallback onPressed
  ) : super(
    borderColor: themeData.over1.color.withDecorationAlpha,
    borderRadius: AppTheme.allBorderRadius,
    enableClip: true,
    child: AppInkResponse(
      padding: const AppEdgeInsets.small(left: AppDimens.normal),
      effectColor: themeData.over1.color,
      child: Row(
        spacing: AppDimens.normal,
        children: [
          Expanded(
            child: Text(role, style: themeData.overStyled1.normalText.regular)
          ),
          isSelected
            ? Icon(AppIcons.checkCircle, color: themeData.accent1.color)
            : const SizedBox.square(dimension: 24)
        ]
      ),
      onPressed: onPressed
    )
  );
}

class CoverLetterSettings {
  final String companyName;
  final String role;
  final List<String> coverLetter;

  CoverLetterSettings(this.companyName, this.role, this.coverLetter);
}