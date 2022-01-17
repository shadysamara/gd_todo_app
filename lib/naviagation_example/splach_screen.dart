import 'package:flutter/material.dart';
import 'package:todo_ui/naviagation_example/page1.dart';

class SplachScreen extends StatefulWidget {
  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  NavigationFunction(context) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return Page1();
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NavigationFunction(context);
  }

  @override
  Widget build(BuildContext context) {
    // NavigationFunction(context);
    // Future.delayed(Duration(seconds: 3)).then((v) {
    //   Navigator.of(context)
    //       .pushReplacement(MaterialPageRoute(builder: (context) {
    //     return Page1();
    //   }));
    // });
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 50,
        ),
      ),
    );
  }
}
