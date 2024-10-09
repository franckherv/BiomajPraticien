import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class PDFViewer extends StatefulWidget {
  final String pdfUrl;

  PDFViewer({required this.pdfUrl});

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://docs.google.com/gview?embedded=true&url=${widget.pdfUrl}')
);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.pdfUrl);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("PDF")),
      body: WebViewWidget(controller: _controller,
      ),
    );
  }
}
