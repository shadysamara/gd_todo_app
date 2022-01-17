import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  String message;
  Page2({this.message = 'no data'});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(message),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop('hello this message from screen 2');
            },
            child: Text('back to screen1')),
      ),
    );
  }
}
