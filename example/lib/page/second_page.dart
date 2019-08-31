import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  createState() => _SecondState();
}

class _SecondState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("login successfully\nthis is the second page."),
      ),
    );
  }
}
