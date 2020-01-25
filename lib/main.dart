

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/includes/DialogBox.dart';
import 'package:flutter_app/includes/MainScreen.dart';
import 'package:flutter_app/includes/TickTock.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(BuildContext context) => MainScreen(title: 'Lessons app',),
      '/Make a number':(BuildContext context) => DialogBox(),
      '/Tick - tock':(BuildContext context) => TickTock()
    },
    // ignore: missing_return
    onGenerateRoute: (routeSettings){
      var path = routeSettings.name.split('/');
      if (path[1] == "Make a number") {
        return new MaterialPageRoute(
          builder: (context) => new DialogBox(id:path[1]),
          settings: routeSettings,
        );
      }
      if (path[1] == "Tick - tock") {
        return MaterialPageRoute(
          builder: (context) => new TickTock(id:path[1]),
          settings: routeSettings,
        );
      }
    },
  ));
}