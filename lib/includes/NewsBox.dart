import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/includes/NewsBoxFavourite.dart';

class NewsBox  extends StatelessWidget{
  final String _title;
  final String _text;
  String _imageurl;
  int _num;
  bool _like;
  int _action;

  NewsBox(this._title, this._text, {String imageurl, int num = 0, bool like = false, int action}) {
    _imageurl = imageurl;
    _num = num;
    _like = like;
    _action = action;
  }

  @override
  Widget build(BuildContext context) {
    if (_imageurl != null && _imageurl != '') return Scaffold(
      appBar: AppBar(
        title: Text("News Box With Images"),
      ),
      body:
      Container(
        color: Colors.yellow,
        height: 100.0,
        child: Row(
            children: <Widget>[
              Image.network(_imageurl ,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.all(5.0),
                    child: Column(
                      children: <Widget>[
                        Text(_title,
                          style: TextStyle(fontSize: 15.0),
                          overflow: TextOverflow.ellipsis,),
                        Expanded(
                            child: Text(_text,
                                maxLines: 3,
                                softWrap: true,
                                textAlign:  TextAlign.justify)),
                      ],
                    ),
                  )
              ), if(_action != 1) new NewsBoxFavourite(_num, _like)
            ]
        ),
      ),
      bottomNavigationBar:
      RaisedButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Text('Go back'),),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Just News Box"),
      ),
      body:
      Container(
        color: Colors.black12,
        height: 100.0,
        child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.all(5.0),
                    child: Column(
                      children: <Widget>[
                        Text(_title,
                          style: TextStyle(fontSize: 15.0),
                          overflow: TextOverflow.ellipsis,),
                        Expanded(
                            child: Text(_text,
                                softWrap: true,
                                textAlign:  TextAlign.justify)),
                      ],
                    ),
                  )
              ), if(_action != 1) new NewsBoxFavourite(_num, _like)
            ]
        ),
      ),
      bottomNavigationBar:
      RaisedButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Text('Go back'),
      ),
    );

  }
}