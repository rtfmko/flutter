import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/includes/InfiniteList.dart';

class InfiniteListState extends State<InfiniteList>{

  final String _title;
  InfiniteListState(this._title);

  @override
  Widget build(BuildContext context) {
    int _value = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: ListView.builder(itemBuilder: (context,i){
          if(i.isOdd) return Divider();
          if(_value==63){
            _value = 1;
            return ListTile(
              title: Text('Overflow\nValue set to $_value'),
            );
          }
          return ListTile(
            title: Text('2 ^ $_value = ' + pow(2, _value++).toString()),
          );
        }),
      ),
    );
  }
}