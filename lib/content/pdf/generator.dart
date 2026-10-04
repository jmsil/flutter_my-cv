import 'dart:js_interop';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:web/web.dart' as web;

import 'education.dart';
import 'experience.dart';
import 'knowledge.dart';
import 'languages.dart';
import 'professional_summary.dart';
import 'profile.dart';
import 'theme.dart';

class PdfGenerator {
  static void generateAndDownload(String language) async {
    final Document doc = Document();
    final font = await PdfGoogleFonts.robotoRegular();
    final fontBold = await PdfGoogleFonts.robotoBold();
    final fontItalic = await PdfGoogleFonts.robotoItalic();

    doc.addPage(
      MultiPage(
        pageTheme: PageTheme(
          pageFormat: PdfPageFormat.a4,
          margin: const EdgeInsets.all(48),
          buildBackground: (Context context) => FullPage(
            ignoreMargins: true,
            child: Container(color: PdfTheme.backgroundColor)
          ),
          theme: ThemeData.withFont(base: font, bold: fontBold, italic: fontItalic)
        ),
        build: (Context context) => [
          PdfProfile(),
          PdfProfessionalSummary(),
          PdfExperience(),
          PdfEducation(),
          PdfKnowledgeImprovements(),
          PdfLanguages()
        ]
      )
    );

    _save(doc, language);
  }

  static void _save(Document doc, String language) async {
    Uint8List bytes = await doc.save();
    JSArray<JSUint8Array> jsArray = [bytes.toJS].toJS;
    String url = web.URL.createObjectURL(
      web.Blob(jsArray, web.BlobPropertyBag(type: 'application/pdf'))
    );

    web.HTMLAnchorElement anchor = web.document.createElement('a') as web.HTMLAnchorElement;
    anchor.href = url;
    anchor.download = 'my-cv_${language}.pdf';
    anchor.style.display = 'none';
    web.document.body?.appendChild(anchor);
    anchor.click();
    web.document.body?.removeChild(anchor);
    web.URL.revokeObjectURL(url);
  }
}