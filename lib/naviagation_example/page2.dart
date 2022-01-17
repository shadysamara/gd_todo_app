import 'dart:developer';

import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  String message;
  Page2({this.message = 'no data'});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.message),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('back to screen1')),
        ),
      ),
    );
  }
}
