import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class NewTransaction extends StatefulWidget { // After Bottom Sheet implementation , the data was getting lost untill NewTransaction is changed to StatefulWidget...
  final Function  addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

   @override
   Widget build(BuildContext context) {
     return Card( elevation: 5,
         child: Container(
           padding : EdgeInsets.all(10),
           child: Column( crossAxisAlignment: CrossAxisAlignment.end,
             children: <Widget>[
               TextField(decoration: InputDecoration(labelText: "Title"),controller: titleController,keyboardType: TextInputType.text , ),
               TextField(decoration: InputDecoration(labelText: "Amount"),controller: amountController, keyboardType: TextInputType.number),
               FlatButton(onPressed: (){
                 if((titleController.text).isEmpty||(amountController.text).isEmpty){
                   return Fluttertoast.showToast(
                       msg: "Invalid Input",
                       toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.BOTTOM,
                       timeInSecForIos: 1,
                       backgroundColor: Colors.red,
                       textColor: Colors.white,
                       fontSize: 16.0
                   );
                 }else{
                 widget.addTx(titleController.text,double.parse(amountController.text));}
               },
               child:Text("Add Transaction", style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold, fontSize: 15.0 ),))
             ],
           ),
         )
     );
   }
}
