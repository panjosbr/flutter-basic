import 'package:flutter/material.dart';
import 'package:mdapp/animation-controller-widget.dart';
import 'package:mdapp/create.widget.dart';

import 'animations.widget.dart';

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            child: Text('Create'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return CreateWidget();
                }),
              );
            },
          ),
        ),
        SizedBox(height: 30,),
        Center(
          child: ElevatedButton(
            child: Text('Animations'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return AnimationsWidget();
                }),
              );
            },
          ),
        ),
        SizedBox(height: 30,),
        Center(
          child: ElevatedButton(
            child: Text('Animations Controller'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return AnimationControllerWidget();
                }),
              );
            },
          ),
        ),
        
      ],
    );
  }
}
