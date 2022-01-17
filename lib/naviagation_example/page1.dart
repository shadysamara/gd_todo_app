import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_ui/naviagation_example/page2.dart';

class Page1 extends StatelessWidget {
  Future<int> getAsyncSum(int x, int y) async {
    await Future.delayed(Duration(seconds: 3));
    return x + y;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              var x = getAsyncSum(1, 2);
              log(x.toString());
              // Future<String> message = Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) {
              //   return Page2(
              //     message: 'hello from page1',
              //   );
              // }));
              // print(message);
            },
            child: Text('Go to screen2')),
      ),
    );
  }
}
