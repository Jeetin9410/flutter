import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{

@override
  State<StatefulWidget> createState() {
    
    return MyAppState();
  }

}

class MyAppState extends State<MyApp>{


int answerIndex = 0;
var questions = ['What is your name?','What are you doing?','how are you?'];
void answerQuestion(){
  setState(() {
    answerIndex++;
  });
  print(answerIndex);
}
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text("Campus 365"), 
      ),
      body: Column(
        children: <Widget>[
          Text(questions.elementAt(answerIndex)),
          RaisedButton(
            child: Text("Option1"),
            onPressed: answerQuestion,
          ),
           RaisedButton(
            child: Text("Option2"),
            onPressed: answerQuestion,
          ),
           RaisedButton(
            child: Text("Option3"),
            onPressed: answerQuestion,
          ),
           RaisedButton(
            child: Text("Option4"),
            onPressed: answerQuestion,
          )
        ],
      ),
    )
    );
  }
}
