import 'package:flutter/material.dart';
import 'package:flutter_expense_manager/models/transaction.dart';
import 'package:flutter_expense_manager/widgets/new_transaction.dart';
import 'package:flutter_expense_manager/widgets/transaction_list.dart';
import 'package:flutter_expense_manager/widgets/user_transaction.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Expense Manager",),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Text("Here Chart will be placed"),
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
            ),
           UserTransactions(),
          ],
        ),
      ),
    );
  }

}