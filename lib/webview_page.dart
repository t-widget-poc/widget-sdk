import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebView")
      ),
      body: Builder(builder: (BuildContext context){
        return WebView(
          initialUrl: "https://flutter.dev/",
          javascriptMode: JavascriptMode.unrestricted,
        );
      }),
    );
  }

}