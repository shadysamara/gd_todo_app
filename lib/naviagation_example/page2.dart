import 'dart:developer';

import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  static String routeName = 'page2';
  String message;
  Page2({this.message = 'no data'});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    // Page2Arguments args =
    //     ModalRoute.of(context).settings.arguments as Page2Arguments;
    // TODO: implement build
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.message),
        ),
        body: Center(
          child: Text(widget.message),
          // child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //     child: Text('back to screen1')),
        ),
      ),
    );
  }
}

class Page2Arguments {
  String message;
  String title;
  Page2Arguments(this.title, this.message);
}
