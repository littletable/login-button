import 'package:example/page/login_page.dart';
import 'package:example/page/second_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoginButton test',
      home: LoginPage(),
      routes: <String, WidgetBuilder> {
        "/first": (BuildContext context) => new LoginPage(),
        "/second": (BuildContext context) => new SecondPage(),
      },
    );
  }
}
