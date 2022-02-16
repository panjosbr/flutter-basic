import 'package:flutter/material.dart';
import 'package:mdapp/ui/animation-controller.ui.dart';

class AnimationControllerWidget extends StatefulWidget {
  const AnimationControllerWidget({Key key}) : super(key: key);

  @override
  _AnimationControllerWidgetState createState() =>
      _AnimationControllerWidgetState();
}

class _AnimationControllerWidgetState extends State<AnimationControllerWidget>
    with SingleTickerProviderStateMixin, AnimationControllerUI {
  AnimationController animationController;
  Animation<double> animationUserName;
  Animation<double> animationPassword;
  Animation<double> animationOpacityForgotPassword;
  Animation<double> animationButtonSignInWidth;
  Animation<double> animationButtunCircular;
  Animation<bool> animationLoader;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animationUserName =
        Tween<double>(begin: 0, end: 470).animate(animationController);
    animationPassword =
        Tween<double>(begin: 0, end: -470).animate(animationController);
    animationOpacityForgotPassword =
        Tween<double>(begin: 1, end: 0).animate(animationController);
    animationButtonSignInWidth =
        Tween<double>(begin: MediaQuery.of(context).size.width, end: 50).animate(animationController);
    animationButtunCircular =
        Tween<double>(begin: 8, end: 40).animate(animationController);
    animationLoader =
        Tween<bool>(begin: false, end: true).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _onTap() {
    animationController.value > 0
        ? animationController.reverse()
        : animationController.forward();
  }

  Widget _column() {
    return Column(
      children: [
        logo(),
        AnimatedBuilder(
          animation: animationUserName,
          child: inputUserName(),
          builder: (BuildContext context, Widget child) {
            return Transform.translate(
              offset: Offset(animationUserName.value, 0),
              child: child,
            );
          },
        ),
        AnimatedBuilder(
          animation: animationPassword,
          child: inputPassword(),
          builder: (BuildContext context, Widget child) {
            return Transform.translate(
              offset: Offset(animationPassword.value, 0),
              child: child,
            );
          },
        ),
        AnimatedBuilder(
          animation: animationOpacityForgotPassword,
          child: textForgetPassword(),
          builder: (BuildContext context, Widget child) {
            return Opacity(
              opacity: animationOpacityForgotPassword.value,
              child: child,
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationController'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _column(),
            AnimatedBuilder(
                animation: animationController,
                builder: (
                  BuildContext context,
                  Widget child,
                ) {
                  return buttonSignIn(
                    onTap: _onTap,
                    width: animationButtonSignInWidth.value,
                    circular: animationButtunCircular.value,
                    isLoading: animationButtunCircular.value > 8,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
