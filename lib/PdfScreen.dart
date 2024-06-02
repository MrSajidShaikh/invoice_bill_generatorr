import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'AddScreen.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class pdfbillscreen extends StatefulWidget {
  const pdfbillscreen({super.key});

  @override
  State<pdfbillscreen> createState() => _pdfbillscreenState();
}

class _pdfbillscreenState extends State<pdfbillscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => generatepdf(),
      ),
    );
  }
}

Future<Uint8List> generatepdf() async {
  final pdf = pw.Document();


  pdf.addPage(pw.Page(
    pageFormat: PdfPageFormat.a4,
    build: (context) => pw.Column(children: [
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
        pw.Text("HAD Supermart ",
            style: pw.TextStyle( fontSize: 30))
      ]),

      pw.SizedBox(height: 25),

      pw.SizedBox(height: 25),
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
        pw.Text(
            "104 ,near Royle Star complex, Varacha , Surat",
            style: pw.TextStyle( fontSize: 18))
      ]),
      pw.SizedBox(height: 25),
      pw.Table(border: pw.TableBorder.all(width: 2), children: [
        pw.TableRow(children: [
          pw.Text("Sr.",
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(fontSize: 15)),
          pw.Text("Product Name",
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle( fontSize: 15)),
          pw.Text("Quantity",
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle( fontSize: 15)),
          pw.Text("price",
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle( fontSize: 15)),
        ]),
        ...List.generate(
          productlist.length,
              (index) => pw.TableRow(children: [
            pw.Text("${index + 1}",
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle( fontSize: 15)),
            pw.Text(productlist[index].proname!.text,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle( fontSize: 15)),
            pw.Text(productlist[index].qty!.text,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle( fontSize: 15)),
            pw.Text(productlist[index].price!.text,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle( fontSize: 15)),
          ]),
        ),


      ]),
      pw.SizedBox(height: 10),
      pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [

            pw.Text('Total :',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle( fontSize: 15)),
            pw.Text('$amount',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle( fontSize: 15)),
          ]),
    ]),
  ));
  return await pdf.save();
}