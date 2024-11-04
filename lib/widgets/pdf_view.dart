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
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(
        Uri.parse('https://docs.google.com/gview?embedded=true&url=${widget.pdfUrl}'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PDF"),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: _controller,
          ),
          if (isLoading) 
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
