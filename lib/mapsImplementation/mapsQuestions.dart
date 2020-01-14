import 'package:flutter/cupertino.dart';

class Questions extends StatelessWidget{
  String mQuestion;
  Questions(this.mQuestion);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Text(mQuestion,
          style: TextStyle(
              fontSize: 20.0),
        )
      )

    );
  }
  
}