import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:maple_joe/config/i18n/index.dart';
import 'package:webview_flutter/webview_flutter.dart';

var tabs = getLangText('ranking')['tabs'];

class WebViewScreen extends StatefulWidget {
  final title;
  final url;
  const WebViewScreen({Key? key, @required this.url, this.title})
      : super(key: key);
  @override
  _MapSearch createState() => _MapSearch();
}

class _MapSearch extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child:const  Icon(Icons.arrow_back_ios_new),
          onPressed: ()=>Navigator.pop(context),
        ),
        title: Text(widget.title ?? ''),

      ),
      body: WebviewScaffold(
        url: widget.url,
      ),
    );
  }
}
