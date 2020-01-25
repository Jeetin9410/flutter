import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_manager/models/transaction.dart';
import 'package:intl/intl.dart';

 class TransactionList extends StatelessWidget {
   final List<Transaction> transactions;
   final Function deleteTx;
   TransactionList(this.transactions,this.deleteTx);
   @override
   Widget build(BuildContext context) {
     return Container(
       height: 450,
       child: transactions.isEmpty ? Column(
         children: <Widget>[
          Text("No Transaction to show here",style: Theme.of(context).textTheme.title,),
           SizedBox( height: 15,), // this box is used to add empty spacing
           Container(  // this container is added here beacause Column parent can take as much as height , so thi simage was going out of screen , so to bound it in a space , container of fixed height is used
             height: 300,
           child: Image.asset("assets/images/waiting.png"))
         ],
       ) :
       ListView.builder(
         itemBuilder: (ctx, index) {
           return Card(
             elevation: 5,
             margin: EdgeInsets.symmetric(
               vertical: 8,
               horizontal: 5,
             ),
             child:  Row(
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
                   child : Text("\₹"+transactions[index].amount.toStringAsFixed(2),
                     style: Theme.of(context).textTheme.title,
                   ),
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                    FittedBox(child: Text(transactions[index].title,style: Theme.of(context).textTheme.title, ),) ,
                     Text( DateFormat.yMMMd().format(transactions[index].date), ),
                   ],
                 ),
                 new Expanded(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: <Widget>[
                         IconButton(icon: Icon(Icons.delete),color: Colors.red ,
                           onPressed:() => deleteTx(transactions[index].id),)
                       ],
                     )
                 ),
               ],
             ),
           );
         },
         itemCount: transactions.length,
       ),
     );
   }
 }
