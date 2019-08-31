import 'package:example/controller/my_controller.dart';
import 'package:flutter/material.dart';
import 'package:login_button/login_button.dart';

class LoginPage extends StatefulWidget {
  createState() => _LoginState();
}

class _LoginState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoginButton(
          loginController: MyController(context),
          body: Text("Login"),
          backgroundColor: Colors.cyan,
        ),
      ),
    );
  }
}
