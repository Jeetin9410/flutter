import 'package:flutter/material.dart';
import 'package:flutter_expense_manager/transaction.dart';
import 'package:intl/intl.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final List<Transaction> transactions = [
    Transaction(
      id:'t1',
      title: 'Gucchi',
      amount: 90.0,
      date: DateTime.now(),
    ),
    Transaction(
      id:'t2',
      title: 'Adidas',
      amount: 80.0,
      date: DateTime.now(),
    ),
    Transaction(
      id:'t3',
      title: 'Sparks',
      amount: 70.0,
      date: DateTime.now(),
    ),
    Transaction(
      id:'t4',
      title: 'Bata',
      amount: 50.0,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Expense Manager",),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Text("Here Chart will be placed"),
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),

            ),
            Column(
              children: transactions.map((tx){
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin : EdgeInsets.symmetric( vertical: 10, horizontal: 15,),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2
                          )
                        ),
                        padding: EdgeInsets.all(10),
                        child : Text("\$"+tx.amount.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.purple,
                        ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(tx.title, style: TextStyle( fontSize: 15,fontWeight: FontWeight.bold) ,),
                          Text( DateFormat('yyyy-mm-dd').format(tx.date),
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                        ],
                      )
                    ],),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }

}