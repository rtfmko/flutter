import 'package:flutter/cupertino.dart';
import 'package:flutter_app/state/TickTockState.dart';

class TickTock extends StatefulWidget{
  String _id;

  TickTock({String id}):_id = id;

  @override
  createState() => TickTockState(id: _id);
}