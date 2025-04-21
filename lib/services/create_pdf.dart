import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

Future<void> createPDF(String reportContent) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          // Title
          pw.Header(
            level: 0,
            child: pw.Text(
              "Interview Preparation Content",
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
          ),

          // Report Content
          pw.Paragraph(
            text: "Content:",
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
          ),
          pw.Paragraph(text: reportContent, style: pw.TextStyle(fontSize: 14)),
        ];
      },
    ),
  );

  // Save PDF
  final outputDir = await getTemporaryDirectory();
  final file = File("${outputDir.path}/interview_prep.pdf");
  await file.writeAsBytes(await pdf.save());

  // Open PDF
  await OpenFile.open(file.path);
}
