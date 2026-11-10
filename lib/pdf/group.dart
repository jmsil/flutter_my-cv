import 'package:pdf/widgets.dart';

import 'text.dart';
import 'theme.dart';

class PdfMainGroup extends _Group {
  PdfMainGroup.child({
    required super.title,
    required Widget child
  }) : super(
    addStartSpacing: true,
    children: [child]
  );

  PdfMainGroup.children({
    required super.title,
    required super.children
  }) : super(addStartSpacing: true);

  @override
  Widget buildTitle() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: PdfTheme.decorationColor,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Center(
        child: PdfText(title, style: PdfTheme.largeTextBoldStyle)
      )
    );
  }
}

class PdfSubGroup extends _Group {
  final String? detail;
  final bool addDivider;

  PdfSubGroup.info({
    required super.title,
    this.detail,
    this.addDivider = true,
    required String info
  }) : super(
    addStartSpacing: false,
    children: [PdfText(info, style: PdfTheme.normalTextStyle)]
  );

  PdfSubGroup.child({
    required super.title,
    this.detail,
    this.addDivider = true,
    required Widget child
  }) : super(
    addStartSpacing: false,
    children: [child]
  );

  @override
  Widget buildTitle() {
    Widget builtTitle = PdfText(title, style: PdfTheme.largeTextBoldStyle);

    if (addDivider) {
      builtTitle = Row(
        children: [
          builtTitle,
          PdfTheme.normalHorizontalSpace,
          Expanded(
            child: Divider(
              thickness: 1.5,
              color: PdfTheme.decorationColor
            )
          )
        ]
      );
    }

    if (detail != null) {
      builtTitle = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          builtTitle,
          PdfText(detail!, style: PdfTheme.normalTextItalicStyle)
        ]
      );
    }

    return builtTitle;
  }
}

abstract class _Group extends StatelessWidget {
  final String title;
  final bool addStartSpacing;
  final List<Widget> children;

  _Group({
    required this.title,
    required this.addStartSpacing,
    required this.children
  });

  @override
  Widget build(Context context) {
    final List<Widget> builtChildren = [];

    for (Widget child in children) {
      builtChildren.add(child);
      builtChildren.add(PdfTheme.largeVerticalSpace);
    }

    builtChildren.removeLast();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (addStartSpacing)
          PdfTheme.xLargeVerticalSpace,

        buildTitle(),
        PdfTheme.normalVerticalSpace,
        ...builtChildren
      ]
    );
  }

  Widget buildTitle();
}