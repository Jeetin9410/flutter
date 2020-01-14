import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp>{
  String name = '';
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateful Widget Testing"),
        ),
        body:
        Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
             child:Column(
               children: <Widget>[
                 TextField(
                   onChanged: (String string){
                     setState(() {
                       name = string;
                     });
                   },
                 ) ,

               ],
             )
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text("Your text is $name"),
            ),
          ],
        ),
      ),
    );
  }

}