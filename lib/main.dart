import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_ui/naviagation_example/page1.dart';
import 'package:todo_ui/naviagation_example/page2.dart';
import 'package:todo_ui/naviagation_example/splach_screen.dart';
import 'package:todo_ui/providers/todo_provider.dart';
import 'package:todo_ui/router.dart';
import 'package:todo_ui/ui/todo_main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    ChangeNotifierProvider<TodoProvider>(
      create: (context) {
        return TodoProvider();
      },
      child: EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/langs', // <-- change the path of the translation files
          fallbackLocale: Locale('en'),
          child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      designSize: Size(411, 820),
      minTextAdapt: true,
      builder: () => MaterialApp(
        navigatorKey: RouterClass.routerClass.navKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: SplachScreen(),
        routes: RouterClass.routerClass.map,
        onGenerateRoute: (RouteSettings routeSettings) {
          String routeName = routeSettings.name;
          var routeArguemnts = routeSettings.arguments;
          switch (routeName) {
            case ('screen1'):
              return MaterialPageRoute(builder: (context) {
                return Page1(paramaeters: routeArguemnts.toString());
              });
              break;
            case ('screen2'):
              return MaterialPageRoute(builder: (context) {
                return Page2(message: routeArguemnts.toString());
              });
              break;
          }
          return MaterialPageRoute(builder: (context) {
            return UndefinedRouter(routeName);
          });
        },

        /* Builder(builder: (context) {
            return Scaffold(
              body: Center(
                child: RaisedButton(
                  onPressed: () {
                    print(MediaQuery.of(context).size.width.toString());
                    print(MediaQuery.of(context).size.height.toString());
                  },
                ),
              ),
            );
          })*/
      ),
    );
  }
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.language),
        onPressed: () {
          if (context.locale == Locale('en')) {
            context.setLocale(Locale('ar'));
          } else {
            context.setLocale(Locale('en'));
          }
        },
      ),
      appBar: AppBar(
        title: Text('app_name'.tr()),
      ),
      body: Center(
        child: Text('course_name'.tr()),
      ),
    );
  }
}

class ResponsiveTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 410.h,
        width: 205.w,
        color: Colors.red,
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Screen2(
              content: 'this is data from screen 1',
            );
          }));
        },
      ),
      appBar: AppBar(
        title: Text('Screen1'),
      ),
      body: Center(
        child: Text('Screen1'),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  String content;
  Screen2({this.content});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      appBar: AppBar(
        title: Text('Screen2'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(content),
      ),
    );
  }
}

class UndefinedRouter extends StatelessWidget {
  String incorrectPath;
  UndefinedRouter(this.incorrectPath);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Text('Sorry the path $incorrectPath is not found'),
      ),
    );
  }
}
