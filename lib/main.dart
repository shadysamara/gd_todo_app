import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_ui/ui/todo_main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/langs', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
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
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: Screen1()

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
