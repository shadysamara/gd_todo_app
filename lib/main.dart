import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: TodoMainPage(),
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
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width / 2,
        color: Colors.red,
      ),
    );
  }
}
