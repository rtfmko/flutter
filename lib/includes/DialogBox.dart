import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/includes/MyPopup.dart';

class DialogBox extends StatelessWidget {
  final String _id;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  DialogBox({String id}):_id = id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('$_id window'),),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                bool value = await Navigator.push(context, PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) => MyPopup(),
                    transitionsBuilder: (___, Animation<double> animation, ____, Widget child) {
                      return FadeTransition(
                        opacity: animation,
                        child: ScaleTransition(
                          scale: animation,
                          child: child,),);
                    }
                ));
                if(value==null) return _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Choose something'),backgroundColor: Colors.blue,));
                if(value) return _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('More'),backgroundColor: Colors.green,));
                else return _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Smaller'),backgroundColor: Colors.red,));
              },child: Text('Make a number'),)
          ],
        ),
      ),
      bottomNavigationBar: RaisedButton(onPressed: () {Navigator.pop(context);},child: Text('Back'),),
    );
  }
}