import 'package:pdf/widgets.dart';

import 'theme.dart';

class PdfDivider extends Divider {
  static const double _size = 1.5;

  PdfDivider() : super(
    height: _size * 6, thickness: _size,
    color: PdfTheme.decorationColor
  );
}