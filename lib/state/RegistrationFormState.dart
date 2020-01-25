import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/Genderlist.dart';
import 'package:validators/validators.dart';

class RegistrationFormState extends State{
  final _formKey = GlobalKey<FormState>();
  GenderList _gender;
  bool _agreement = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: Form(key: _formKey,
              child: Column(
                children: <Widget>[
                  Text('User name: ', style: TextStyle(fontSize: 20.0),),
                  TextFormField(
                      validator: (value) {
                        if(value.trim().isEmpty) return 'Please enter your name';
                        return null;
                      }),
                  SizedBox(height: 20.0,),

                  Text('E-mail', style: TextStyle(fontSize: 20.0),),
                  TextFormField(
                    validator: (value) {
                      if(value.trim().isEmpty) return 'Please enter your e-mail';
                      if(!isEmail(value.trim())) return 'This is not an e-mail';
                      return null;
                    },
                  ),

                  SizedBox(height: 20.0),

                  Text('Select your gender: ', style: TextStyle(fontSize: 20.0),),

                  RadioListTile(
                    title: const Text('Male'),
                    value: GenderList.male,
                    groupValue: _gender,
                    onChanged: (GenderList value) {setState(() { _gender = value;});},
                  ),

                  RadioListTile(
                    title: const Text('Female'),
                    value: GenderList.female,
                    groupValue: _gender,
                    onChanged: (GenderList value) {setState(() { _gender = value;});},
                  ),

                  SizedBox(height: 20.0),

                  CheckboxListTile(
                      value: _agreement,
                      title: Text('Я ознакомлен'
                          + (_gender==null? '(a)' : _gender==GenderList.male?'':'a')
                          + ' с документом "Согласие на обработку персональных данных" '
                              'и даю согласие на обработку моих персональных данных в '
                              'соответствии с требованиями '
                              '"Федерального закона О персональных данных № 152-ФЗ".'),
                      onChanged: (bool value) => setState(() => _agreement = value)),

                  RaisedButton(onPressed: (){
                    if(_formKey.currentState.validate()){
                      Color _color = Colors.red;
                      String _text;

                      if(_gender==null) _text = 'Choose your gender';
                      else if(!_agreement) _text = 'You must accept the terms of the agreement';
                      else {_text = 'The form is successfully completed'; _color = Colors.green;}

                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(_text),
                        backgroundColor: _color,));
                    }
                  },
                    child: Text('Check'),
                    color: Colors.blue,
                    textColor: Colors.white,)
                ],
              )
          ),
        )
      ],);
  }
}