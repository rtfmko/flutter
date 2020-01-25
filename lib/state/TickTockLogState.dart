import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/Programs/Flutter/FirstApp/flutter_app/lib/data/Log.dart';

class TickTockLogState extends State{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log'),),
      body: ListView(
        children: <Widget>[
          if(Log().getLog()!=null) Text(Log().getLog().toString(),style: TextStyle(fontSize: 20.0),),
          if(Log().getLog()==null) Text('Emty log', style: TextStyle(fontSize: 20.0),)
        ],
      ),
    );
  }
}