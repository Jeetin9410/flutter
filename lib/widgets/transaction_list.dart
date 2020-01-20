import 'package:flutter/material.dart';
import 'package:flutter_expense_manager/models/transaction.dart';
import 'package:intl/intl.dart';

 class TransactionList extends StatelessWidget {
   final List<Transaction> transactions;

   TransactionList(this.transactions);
   @override
   Widget build(BuildContext context) {
     return Column(
       children: transactions.map((tx){
         return Card(
           elevation: 5,
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
     );
   }
 }