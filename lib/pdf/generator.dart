import 'dart:js_interop';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:web/web.dart' as web;

import '../../ui/assets.dart';
import '../ui/strings/strings_model.dart';
import 'cover_letter.dart';
import 'education.dart';
import 'experience.dart';
import 'languages.dart';
import 'online_cv.dart';
import 'professional_dev.dart';
import 'professional_summary.dart';
import 'profile.dart';
import 'theme.dart';

class PdfGenerator {
  static void downloadCv() {
    _generateAndSave(
      'Joao-Marques-Silva_CV',
      [
        PdfProfile(addCvLink: false),
        PdfProfessionalSummary(),
        PdfOnlineCv(),
        PdfExperience(),
        PdfEducation(),
        PdfProfessionalDevelopment(),
        PdfLanguages()
      ]
    );
  }

  static void downloadCoverLetter(String companyName, List<String> info) {
    _generateAndSave(
      'Joao-Marques-Silva_CL_${companyName.replaceAll(' ', '-')}',
      [
        PdfProfile(addCvLink: true),
        PdfCoverLetter(info)
      ]
    );
  }

  static void _generateAndSave(String fileName, List<Widget> children) async {
    final Document doc = Document();
    final ByteData font = await AppAssets.loadAsByteData(AppAssets.robotoFont);
    final ByteData fontBold = await AppAssets.loadAsByteData(AppAssets.robotoBoldFont);
    final ByteData fontItalic = await AppAssets.loadAsByteData(AppAssets.robotoItalicFont);

    doc.addPage(
      MultiPage(
        pageTheme: PageTheme(
          pageFormat: PdfPageFormat.a4,
          margin: EdgeInsets.all(PdfTheme.xLargeDimen),
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
        build: (Context context) => children
      )
    );

    _save(doc, fileName);
  }

  static void _save(Document doc, String fileName) async {
    Uint8List bytes = await doc.save();
    JSArray<JSUint8Array> jsArray = [bytes.toJS].toJS;
    String url = web.URL.createObjectURL(
      web.Blob(jsArray, web.BlobPropertyBag(type: 'application/pdf'))
    );

    web.HTMLAnchorElement anchor = web.document.createElement('a') as web.HTMLAnchorElement;
    anchor.href = url;
    anchor.download = '${fileName}_${StringsModel.languageCode}.pdf';
    anchor.style.display = 'none';
    web.document.body?.appendChild(anchor);
    anchor.click();
    web.document.body?.removeChild(anchor);
    web.URL.revokeObjectURL(url);
  }
}