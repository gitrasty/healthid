

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class showPDF extends StatefulWidget {
  final String title;
  final path;
  const showPDF({super.key,required this.title,this.path});

  @override
  State<showPDF> createState() => _showPDFState();
}

class _showPDFState extends State<showPDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
        body: SfPdfViewer.asset(widget.path)
            // .network(
            // 'https://firebasestorage.googleapis.com/v0/b/health-id-99bd5.appspot.com/o/labtest%2FHealth-ID-lab-test.pdf?alt=media&token=baeb0fa0-1369-4411-a396-b5c7cfb67726')
    );
  }
}
