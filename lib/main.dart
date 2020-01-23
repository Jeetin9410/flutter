import 'package:flutter/material.dart';
import 'package:flutter_expense_manager/models/transaction.dart';
import 'package:flutter_expense_manager/widgets/new_transaction.dart';
import 'package:flutter_expense_manager/widgets/transaction_list.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

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

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
     return GestureDetector(
       onTap: () {},
       child: NewTransaction(_addNewTransaction),
       behavior: HitTestBehavior.opaque,
     );
    },);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Expense Manager",),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => _startAddNewTransaction(context))
        ],),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Text("Here Chart will be placed"),
                elevation: 10.0,
                margin: EdgeInsets.all(10.0),
              ),
              TransactionList(transactions),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child : Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ),
    );
  }
}