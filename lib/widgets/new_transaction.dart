import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class NewTransaction extends StatelessWidget {
  final Function  addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addTx);
   @override
   Widget build(BuildContext context) {
     return Card( elevation: 5,
         child: Container(
           padding : EdgeInsets.all(10),
           child: Column( crossAxisAlignment: CrossAxisAlignment.end,
             children: <Widget>[
               TextField(decoration: InputDecoration(labelText: "Title"),controller: titleController, ),
               TextField(decoration: InputDecoration(labelText: "Amount"),controller: amountController, ),
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
                 addTx(titleController.text,double.parse(amountController.text));}
               },
               child:Text("Add Transaction", style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold, fontSize: 15.0 ),))
             ],
           ),
         )
     );
   }
 }
