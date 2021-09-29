import 'package:flutter/material.dart';

class CreateWidget extends StatefulWidget {
  const CreateWidget({Key key}) : super(key: key);

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
      body: Column(
        children: [
          Center(
            child: Text('Welcome to create page'),
          ),
          ElevatedButton(
            child: Text('Snackbar'),
            onPressed: () {
              // new snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('child widget snackbar'),
                ),
              );
            },
          ),
          ElevatedButton(
            child: Text('Dialog'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Dialog'),
                    content: Text('Dialog context'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
