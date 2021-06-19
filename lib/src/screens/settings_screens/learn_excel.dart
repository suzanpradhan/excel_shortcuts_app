import 'dart:convert';
import 'dart:io';

import 'package:excel_shortcuts_app/utils/constants/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LearnExcel extends StatefulWidget {
  const LearnExcel({Key? key}) : super(key: key);

  @override
  _LearnExcelState createState() => _LearnExcelState();
}

class _LearnExcelState extends State<LearnExcel> {
  late WebViewController _controller;

  Future<void> loadHtmlFromAssets(String filename, controller) async {
    String fileText = await rootBundle.loadString(filename);
    controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          title: Text(
            'Learn Excel',
            style: TextStyle(
                fontFamily: "GilroyBold",
                color: CustomColors.cardColor,
                fontSize: 16),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              color: CustomColors.cardColor),
          backgroundColor: CustomColors.white,
          elevation: 0,
        ),
        body: WebView(
          initialUrl: 'about:blank',
          onWebViewCreated: (WebViewController webViewController) async {
            _controller = webViewController;
            await loadHtmlFromAssets(
                'assets/scripts/learn_excel.html', _controller);
          },
        ));
  }
}
