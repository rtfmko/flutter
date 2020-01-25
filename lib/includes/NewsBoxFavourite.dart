import 'package:flutter/cupertino.dart';
import 'package:flutter_app/state/NewsBoxFavouriteState.dart';

class NewsBoxFavourite extends StatefulWidget{
  final int _num;
  final bool _like;

  NewsBoxFavourite(this._num, this._like);

  @override
  createState() => new NewsBoxFavouriteState(_num, _like);
}