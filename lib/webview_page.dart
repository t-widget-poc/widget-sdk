import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({Key key, this.url}) : super(key: key);

  @override
  _WebViewState createState() => _WebViewState(this.url);
}

class _WebViewState extends State<WebViewPage> {
  final String url;

  _WebViewState(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebView")
      ),
      body: Builder(builder: (BuildContext context){
        return WebView(
          initialUrl: this.url,
          javascriptMode: JavascriptMode.unrestricted,
        );
      }),
    );
  }

}