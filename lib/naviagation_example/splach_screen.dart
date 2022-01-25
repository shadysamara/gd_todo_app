import 'package:flutter/material.dart';
import 'package:todo_ui/naviagation_example/page1.dart';
import 'package:todo_ui/router.dart';
import 'package:todo_ui/ui/todo_main_page.dart';

class SplachScreen extends StatefulWidget {
  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  NavigationFunction(context) async {
    await Future.delayed(Duration(seconds: 3));
    RouterClass.routerClass.pushToSpecificScreenUsingWidget(TodoMainPage());
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
