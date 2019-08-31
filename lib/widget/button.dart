import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login_button/controller/login_controller.dart';

/// LoginButton Widget.
class LoginButton extends StatefulWidget {

  /// Create a [LoginButton].
  /// The [text] and [backgroundColor] arguments must not be null.
  const LoginButton({
    Key key,
    @required this.body,
    @required this.backgroundColor,
    this.kitColor = Colors.white,
    this.textStyle,
    this.width = 300.0,
    this.height = 50.0,
    this.duration = 150,
    this.cancelable = false,
    @required this.loginController,
  }) : assert(body != null),
      assert(backgroundColor != null);

  /// The background color of LoginButton.
  final Color backgroundColor;

  /// The color of the SpinKit animation.
  final Color kitColor;

  /// View on LoginButton.
  final Widget body;

  /// Defines the default text style, with [Material.textStyle].
  final TextStyle textStyle;

  /// Width of LoginButton.
  final double width;

  /// Height of LoginButton.
  final double height;

  /// Duration of the button animation, from the original shape to
  /// the round.
  final int duration;

  /// The LoginController controls the button when the button is
  /// tapped or the user login failed.
  final LoginController loginController;

  /// Whether the login process could be canceled.
  final bool cancelable;

  @override
  State createState() => _LoginButtonState();

}

class _LoginButtonState extends State<LoginButton> with SingleTickerProviderStateMixin {

  LoginController _controller;
  AnimationController _animationController;
  Animation<double> _tween;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: widget.duration));
    _tween = new Tween(begin: 0.0,end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {

        });
      });
  }

  @override
  Widget build(BuildContext context) {
    double width = widget.width - (widget.width - widget.height) * _tween.value;
    _controller = widget.loginController;
    return NotificationListener<LoginNotification>(
      onNotification: (notification) {
        setState(() {
          switch(notification.msg) {
            case "failed":
            case "success":
              onOver();
              return true;
            default:
              return false;
          }
        });
        return false;
      },
      child: Builder(builder: (context) {
        _controller.buildContext = context;
        return new GestureDetector(
          child: new Container(
            width: width,
            height: widget.height,
            alignment: FractionalOffset.center,
            decoration: new BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: new BorderRadius.all(
                Radius.circular(widget.height / 2)
              ),
            ),
            child: _loading ? SpinKitRing(
              color: widget.kitColor,
              size: widget.height * 0.8,
              lineWidth: widget.height * 0.05,
            ) : widget
          ),
          onTap: onTap
        );
      })
    );
  }

  onTap() {
    if(!_loading && !_animationController.isAnimating) {
      setState(() {
        _animationController.forward(from: 0.0);
        _loading = true;
      });
      widget.loginController.onLogin();
    } else if(_loading) {
      setState(() {
        _animationController.reverse();
        _loading = false;
      });
      widget.loginController.onCancel();
    }

  }

  onOver() {
    if(!_animationController.isAnimating) {
      setState(() {
        _animationController.reverse();
        _loading = false;
      });
    }
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
