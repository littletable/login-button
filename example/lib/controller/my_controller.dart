import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:login_button/login_button.dart';

class MyController extends LoginController {

  MyController(BuildContext context) {
    buildContext = context;
  }

  @override
  void onLogin() {
    print("login.");
    _func();
  }

  @override
  void onCancel() {
    print("cancel.");
    // TODO _fun.cancel()
  }

  @override
  void onFailed() {
    super.onFailed();
    print("failed.");
  }

  @override
  void onSuccess() {
    super.onSuccess();
    print("success.");
    Navigator.pushNamed(buildContext, "/second");
  }

  Future _func() async {
    int result;
    await Future.delayed(Duration(seconds: 2), () {
      result = Random().nextInt(100);
      if(result < 50)
        onFailed();
      else
        onSuccess();
    });
  }

}