import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_flutter/webview_page.dart';
import 'package:http/http.dart' as http;
import 'mini_program_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Widget List'),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new MyHomePage(title: "Widget List"),
        '/webview': (BuildContext context) => new WebViewPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<MiniProgramList> futureWidgets;

  @override
  void initState() {
    super.initState();
    futureWidgets = fetchWidgets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<MiniProgramList>(
              future: futureWidgets,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.widgets.toString());
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pushNamed('/webview'),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                'Widget',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<MiniProgramList> fetchWidgets() async {
  final response = await http.get('http://10.0.2.2:8080/widget_list.json');

  if (response.statusCode == 200) {
    return MiniProgramList.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load widgets.");
  }
}
