import 'package:flutter/material.dart';

class AnimationsWidget extends StatefulWidget {
  const AnimationsWidget({Key key}) : super(key: key);

  @override
  _AnimationsWidgetState createState() => _AnimationsWidgetState();
}

class _AnimationsWidgetState extends State<AnimationsWidget> {
  bool isLoading = false;

  _onTap() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  _buttonAnimation() {
    return Center(
      child: GestureDetector(
        onTap: _onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(isLoading ? 40 : 10),
          ),
          width: isLoading ? 50 : 200,
          height: 50,
          alignment: Alignment.center,
          child: isLoading
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Text(
                  'Button',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }

  _buttonCrossFadeAnimation() {
    return Center(
      child: GestureDetector(
        onTap: _onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(isLoading ? 40 : 10),
          ),
          width: isLoading ? 50 : 200,
          height: 50,
          alignment: Alignment.center,
          child: AnimatedCrossFade(
            duration: Duration(milliseconds: 200),
            firstChild: Text(
              'Button',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            secondChild: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            crossFadeState: isLoading
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),
      ),
      body: _buttonCrossFadeAnimation(),
    );
  }
}
