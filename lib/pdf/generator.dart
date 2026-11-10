import 'dart:js_interop';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:web/web.dart' as web;

import '../../ui/assets.dart';
import 'education.dart';
import 'experience.dart';
import 'languages.dart';
import 'online_resume.dart';
import 'professional_development.dart';
import 'professional_summary.dart';
import 'profile.dart';
import 'theme.dart';

class PdfGenerator {
  static void generateAndDownload(String language) async {
    final Document doc = Document();
    final ByteData font = await AppAssets.loadAsByteData(AppAssets.robotoFont);
    final ByteData fontBold = await AppAssets.loadAsByteData(AppAssets.robotoBoldFont);
    final ByteData fontItalic = await AppAssets.loadAsByteData(AppAssets.robotoItalicFont);

    doc.addPage(
      MultiPage(
        pageTheme: PageTheme(
          pageFormat: PdfPageFormat.a4,
          margin: const EdgeInsets.all(48),
          buildBackground: (Context context) => FullPage(
            ignoreMargins: true,
            child: Container(color: PdfTheme.backgroundColor)
          ),
          theme: ThemeData.withFont(
            base: Font.ttf(font),
            bold: Font.ttf(fontBold),
            italic: Font.ttf(fontItalic)
          )
        ),
        build: (Context context) => [
          PdfProfile(),
          PdfOnlineResume(),
          PdfProfessionalSummary(),
          PdfExperience(),
          PdfEducation(),
          PdfProfessionalDevelopment(),
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
    anchor.download = 'Joao-Marques-Silva_CV_${language}.pdf';
    anchor.style.display = 'none';
    web.document.body?.appendChild(anchor);
    anchor.click();
    web.document.body?.removeChild(anchor);
    web.URL.revokeObjectURL(url);
  }
}