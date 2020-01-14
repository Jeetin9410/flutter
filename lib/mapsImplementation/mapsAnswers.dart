import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Answer extends StatelessWidget{
  final Function setHandler;
  final String answer;
  Answer(this.setHandler, this.answer);
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.all(10.0),
      child: RaisedButton(
           child: Text(answer) ,
          onPressed: setHandler),
    );
  }

}