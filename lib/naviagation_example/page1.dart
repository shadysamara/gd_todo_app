import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_ui/naviagation_example/page2.dart';
import 'package:todo_ui/router.dart';

class Page1 extends StatelessWidget {
  static String routeName = 'page1';
  String paramaeters;
  Page1({this.paramaeters});

  Future<bool> backIfCanPop(context) async {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      return Future.value(true);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('You cant go back from here'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('ok'))
              ],
            );
          });
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Page1'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                RouterClass.routerClass
                    .pushToSpecificScreenUsingWidget(Page2());
                // var x = getAsyncSum(1, 2);
                // log(x.toString());
                // Future<String> message = Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return Page2(
                //     message: 'hello from page1',
                //   );
                // }));
                // print(message);
                // backIfCanPop(context);
                // Navigator.of(context).pushNamed('screen2', arguments: 'hello');
              },
              child: Text('Go to screen2')),
        ),
      ),
    );
  }
}
