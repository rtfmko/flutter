import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/Programs/Flutter/FirstApp/flutter_app/lib/data/Log.dart';
import 'package:flutter_app/includes/SandGlass.dart';
import 'package:flutter_app/includes/TickTock.dart';
import 'package:flutter_app/includes/TickTockLog.dart';
import 'package:validators/sanitizers.dart';

class TickTockState extends State<TickTock> {
  String _id;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  SandGlass clock = SandGlass();
  final _formKey = GlobalKey<FormState>();
  int _time;

  TickTockState({String id}):_id = id;

  _reDrawWidget() async{
    if(clock.time() == 0)return;

    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      Log().setLog('_reDraw\n');
    });
  }

  @override
  Widget build(BuildContext context) {
    if(clock.time()!=0){Log().setLog('clock tick ${clock.time()}\n'); _reDrawWidget();}
    if(_id == null) _id='New';
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('App $_id'),),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text('Time is ${clock.time()}',style: TextStyle(fontSize: 20.0),),

              SizedBox(height: 20.0),

              TextFormField(
                validator: (validate){
                  if(validate.trim().isEmpty) return 'Enter number';
                  try {
                    _time = toInt(validate.trim());
                  }catch (error){
                    return ' "$validate" - Not number';
                  }
                },
              ),

              SizedBox(height: 20.0),

              RaisedButton(onPressed: () {
                if(_formKey.currentState.validate()){
                  Log().clearLog();
                  clock.tick(_time);
                  _reDrawWidget();
                }
              },color: Colors.blue,
                textColor: Colors.white,
                child: Text('Set value'),),

              SizedBox(height: 20.0),

              RaisedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TickTockLog()));
              },color: Colors.blue,
                textColor: Colors.white,
                child: Text('Result'),),
            ],
          ),
        ),
      ),
    );
  }
}