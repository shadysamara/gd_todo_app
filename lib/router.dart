import 'package:flutter/material.dart';
import 'package:todo_ui/naviagation_example/page1.dart';
import 'package:todo_ui/naviagation_example/page2.dart';

class RouterClass {
  RouterClass._();
  static RouterClass routerClass = RouterClass._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  pushToSpecificScreenByName(String screenName) {
    navKey.currentState.pushNamed(screenName);
  }

  pushToSpecificScreenUsingWidget(Widget widget) {
    BuildContext context = navKey.currentContext;
    navKey.currentState.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  popFunction() {
    navKey.currentState.pop();
  }

  Map<String, Widget Function(BuildContext)> map = {
    'screen1': (context) => Page1(),
    'screen2': (context) => Page2(),
  };
}
