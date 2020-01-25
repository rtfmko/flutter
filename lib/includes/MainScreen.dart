import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/includes/InfiniteList.dart';
import 'package:flutter_app/includes/RegistrationForm.dart';
import 'package:flutter_app/includes/NewsBox.dart';

import 'HelloWorld.dart';

class MainScreen extends StatelessWidget{
  final String title;

  MainScreen({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(
        child: Text('Lessons chooser'
            '\nCreated by RTFM\u2120'),),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Leassons Menu'),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Hello World'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => MyHelloWorld()),
                );
              },
            ),
            ListTile(
              title: Text('News Box'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                    new NewsBox('Новый урок по Flutter', '''В новом уроке рассказывается в каких случаях применять класс StatelessWidget и StatefulWidget. Приведены примеры их использования.''',
                      imageurl: 'https://flutter.su/favicon.png', action: 1,)
                )
                );
              },
            ),
            ListTile(
              title: Text('News Box Favourite'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                    new NewsBox('Новый урок по Flutter', '''В новом уроке рассказывается, в каких случаях применять класс StatelessWidget и StatefulWidget. Приведены примеры их использования.''',
                        imageurl: 'https://flutter.su/favicon.png', num: 100))
                );
              },
            ),
            ListTile(
              title: Text('Infinity load'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                  new InfiniteList('Infinity load'),
                ));
              },
            ),
            ListTile(
              title: Text('Registration Form'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      Scaffold(
                        appBar: AppBar(
                          title: Text('Registration Form'),
                        ),
                        body:RegistrationForm() ,
                      ) ,
                ));
              },
            ),
            ListTile(
              title: Text('Make a number'),
              onTap: (){
                Navigator.pushNamed(context, '/Make a number/');
              },
            ),
            ListTile(
              title: Text('Tick - tock'),
              onTap: (){
                Navigator.pushNamed(context, '/Tick - tock/');
              },
            )
          ],
        ),
      ),
    );
  }
}