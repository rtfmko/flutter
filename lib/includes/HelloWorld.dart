import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHelloWorld extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World!"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Hello World!'),
              FlatButton(
                onPressed: () async {
                  const _url = 'https://agrocountry.com';
                  if (await canLaunch(_url)){
                    await launch(_url);
                  } else {
                    throw 'Could not launch $_url';
                  }
                }, child: Text('Open site'),
                color: Colors.green,
                textColor: Colors.white,)
            ],
          ),
        ),
      ), bottomNavigationBar:
    RaisedButton(
      onPressed: (){
        Navigator.pop(context);
      },
      child: Text('Go back'),
    ),
    );
  }
}