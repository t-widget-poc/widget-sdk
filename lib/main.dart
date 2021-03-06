import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter/widget_list.dart';
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
                  print(snapshot.data);
                  return WidgetList(miniProgramList: snapshot.data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<MiniProgramList> fetchWidgets() async {
  final response =
      await http.get('https://intense-temple-71236.herokuapp.com/');

  if (response.statusCode == 200) {
    print(response.body);
    return MiniProgramList.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load widgets.");
  }
}
