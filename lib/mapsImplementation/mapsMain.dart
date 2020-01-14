import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_project/mapsImplementation/mapsAnswers.dart';
import 'package:flutter_first_project/mapsImplementation/mapsQuestions.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp>{
  int answerIndex = 0;
  void _answerQuestion(){
    setState(() {
      answerIndex++;
    });
    print(answerIndex);
  }
  var question = [
    {
      'questions':"What is the color of Sky ?",
      'answer': ['Red','Yellow','Blue','I\'m Color Blind' ]
    },
    {
      'questions':"What is the color of Apple ?",
      'answer': ['Red','Yellow','Blue','I\'m Color Blind' ]
    },
    {
      'questions':"What is the color of Mango ?",
      'answer': ['Red','Yellow','Blue','I\'m Color Blind' ]
    },
    {
      'questions':"What is the color of Chai?",
      'answer': ['Red','Yellow','Blue','LOVE' ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Implementation of HashMaps"),
        ),
        body: Column(
          children: <Widget>[
             Questions(question[answerIndex]['questions']),
            ...(question[answerIndex]['answer'] as List<String>).map((answer){
                      return Answer(_answerQuestion, answer);
            }).toList(),
          ],
        ),
      ),
    );
  }

}