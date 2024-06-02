import 'package:flutter/material.dart';
import 'AddScreen.dart';
import 'HomeScreen.dart';
import 'PdfScreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes:
      {
        '/':(context)=>const Homebillscreen(),
        '/bill':(context)=>const Billscreen(),
        '/pdf':(context)=>const pdfbillscreen(),
      },
    );

  }

}
