import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:my_flutter/mini_program_list.dart';

class WidgetList extends StatelessWidget {
  final MiniProgramList miniProgramList;

  const WidgetList({Key key, this.miniProgramList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: miniProgramList.widgets.length,
          itemBuilder: (BuildContext context, int index) {
            return Align(
              child: FlatButton(
                onPressed: () => _launchURL(context, miniProgramList.widgets[index].url),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${miniProgramList.widgets[index].name}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _launchURL(BuildContext context, String url) async{
    try {
      await launch(
        url,
        option: new CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: new CustomTabsAnimation.slideIn(),
          extraCustomTabs: <String>[
          // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
          'org.mozilla.firefox',
          // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
          'com.microsoft.emmx',
          ],
        ),
      );
    } catch(e){
      debugPrint(e.toString());
    }
  }
}
