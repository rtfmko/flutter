import 'package:flutter/cupertino.dart';
import 'package:flutter_app/state/InfiniteListState.dart';

class InfiniteList extends StatefulWidget{
  final String _title;

  InfiniteList(this._title);

  @override
  createState() => new InfiniteListState(_title);
}