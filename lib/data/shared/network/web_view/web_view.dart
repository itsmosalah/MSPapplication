import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class WebViewHelper extends StatefulWidget {
  late String url;
  WebViewHelper({Key? key,required this.url}) : super(key: key);

  @override
  WebViewHelperState createState() => WebViewHelperState();
}

class WebViewHelperState extends State<WebViewHelper> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    } else {
      WebView.platform = CupertinoWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
    );
  }
}