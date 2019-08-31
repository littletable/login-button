import 'package:flutter/widgets.dart';

/// LoginNotification is a Notification that notifies the parent widget
/// when the method onFailed is called.
class LoginNotification extends Notification {

  /// The argument msg is the content of the notice.
  final String msg;

  LoginNotification({@required this.msg});
}

/// LoginController is a controller of the LoginButton,
/// you must write a controller class extends LoginController,
/// and override the methods: onTap, onSuccess, onFailed and onCancel.
abstract class LoginController {

  /// The buildContext of the LoginButton is used for notifying.
  BuildContext buildContext;

  /// The login method.
  void onLogin();

  /// Something to do when the user login successfully.
  /// You must call the super method when you override this method,
  /// so that when the method onSuccess is called,
  /// the animation will stop.
  @mustCallSuper
  void onSuccess() {
    LoginNotification(msg:"success").dispatch(buildContext);
  }

  /// Something to do when the user login failed.
  /// You must call the super method when you override this method,
  /// so that when the method onFailed is called,
  /// the button can return to the original.
  @mustCallSuper
  void onFailed() {
    LoginNotification(msg:"failed").dispatch(buildContext);
  }

  /// Something to do when the user cancel the login process.
  /// The button will return to the original when the method is called.
  void onCancel();

}