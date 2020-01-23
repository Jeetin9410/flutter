import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';
 class UserTransactions extends StatefulWidget {
   @override
   _UserTransactionsState createState() => _UserTransactionsState();
 }
 
 class _UserTransactionsState extends State<UserTransactions> {
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
   ];

   void _addNewTransaction(String txtitle, double txAmount){
     final newTx = Transaction(title: txtitle, amount: txAmount,date: DateTime.now(),id: DateTime.now().toString(),);
      setState(() {
        transactions.add(newTx);
      });
   }

   @override
   Widget build(BuildContext context) {
     return Column(children: <Widget>[

     ],);
   }
 }
 