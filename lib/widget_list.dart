import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/mini_program_list.dart';
import 'package:my_flutter/webview_page.dart';

class WidgetList extends StatelessWidget {
  final MiniProgramList miniProgramList;

  const WidgetList({Key key, this.miniProgramList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: miniProgramList.widgets.length,
          itemBuilder: (BuildContext context, int index) {
            return FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new WebViewPage(
                          url: miniProgramList.widgets[index].url))),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text("${miniProgramList.widgets[index].name}"),
            );
          }),
    );
  }
}
