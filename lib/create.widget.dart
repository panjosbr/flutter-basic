import 'package:flutter/material.dart';

class CreateWidget extends StatefulWidget {
  const CreateWidget({ Key key }) : super(key: key);

  @override
  _CreateWidgetState createState() => _CreateWidgetState();
}

class _CreateWidgetState extends State<CreateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Page'),
      ),
      body: Center(child: Text('Welcome to create page'),),
    );
  }
}