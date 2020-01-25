import 'package:flutter/material.dart';
import 'package:flutter_expense_manager/models/transaction.dart';
import 'package:flutter_expense_manager/widgets/new_transaction.dart';
import 'package:flutter_expense_manager/widgets/transaction_list.dart';
import 'package:flutter_expense_manager/widgets/chart.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amberAccent,
        fontFamily: "Overpass",
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Overpass",
            fontSize: 18,
          ),
          button: TextStyle(color: Colors.white ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: "SourceSansPro",
              fontSize: 20,
              fontWeight: FontWeight.w500,

            )
          )
        )

      ),
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

  final List<Transaction> _transactions = [
   /* Transaction(
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
      id:'t3',
      title: 'Sparks',
      amount: 70.0,
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
    ),*/
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txtitle, double txAmount ,DateTime choosenDate){
    final newTx = Transaction(title: txtitle, amount: txAmount,date: choosenDate,id: DateTime.now().toString(),);
    setState(() {
      _transactions.add(newTx);
    });
    Navigator.of(context).pop();
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

  void _deleteTransaction(String id){
    setState(() {
      _transactions.removeWhere((tx){
        return tx.id==id;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: Text("Expense Manager",),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.add), onPressed: () => _startAddNewTransaction(context))
      ],);
    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height
                - MediaQuery.of(context).padding.top)*0.3,
                  child: Chart(_recentTransactions)),
              Container(
                  height: (MediaQuery.of(context).size.height - appBar.preferredSize.height- MediaQuery.of(context).padding.top)*0.7,
                  child: TransactionList(_transactions,_deleteTransaction)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child : Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      );
  }
}