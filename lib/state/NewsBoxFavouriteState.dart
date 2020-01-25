import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/includes/NewsBoxFavourite.dart';

class NewsBoxFavouriteState extends State<NewsBoxFavourite> {

  int num;
  bool like;

  NewsBoxFavouriteState(this.num, this.like);

  void pressButton(){
    setState(() {
      like = !like;

      if(like) num++;
      else num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Text('В избранном', textAlign: TextAlign.center,),
            IconButton(
                icon: Icon(like ? Icons.star : Icons.star_border,
                  size: 30.0,
                  color: Colors.blue,),
                onPressed: pressButton),
            Text('$num')
          ]
          ,)
    );
  }
}