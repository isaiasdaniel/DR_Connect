import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VirtualWebView extends StatefulWidget {
  final String url ;

  const VirtualWebView({Key? key,this.url=''}):super(key: key);

  @override
  VirtualWebViewState createState() => VirtualWebViewState();
}

class VirtualWebViewState extends State<VirtualWebView> {

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (defaultTargetPlatform==TargetPlatform.android) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    if(defaultTargetPlatform==TargetPlatform.windows){
      return const Text('unsupported platform');
    }
    // IFrameElement().src=widget.url;
    //  platformViewRegistry.registerViewFactory(viewTypeId, (viewId) => null)
    return WebView(
      onWebResourceError: (WebResourceError webviewerrr) {
        print('error: ${webviewerrr.description}');
      },
      initialUrl: widget.url,
    );
  }
}