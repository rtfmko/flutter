import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Make a number'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {Navigator.pop(context,true);},
          child: Text('More'),
        ),
        FlatButton(
          onPressed: () {Navigator.pop(context,false);},
          child: Text('Smaller'),
        ),
      ],
    );
  }
}