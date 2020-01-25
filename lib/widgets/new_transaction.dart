import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget { // After Bottom Sheet implementation , the data was getting lost untill NewTransaction is changed to StatefulWidget...
  final Function  addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime _selectedDate;

  void _presentDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now()).then((pickedDate){
          if(pickedDate == null){ return; }
          setState(() {
            _selectedDate = pickedDate;
          });
    });
  }

   @override
   Widget build(BuildContext context) {
     return Card( elevation: 5,
         child: Container(
           padding : EdgeInsets.all(10),
           child: Column( crossAxisAlignment: CrossAxisAlignment.end,
             children: <Widget>[
               TextField(decoration: InputDecoration(labelText: "Title"),controller: titleController,keyboardType: TextInputType.text , ),
               TextField(decoration: InputDecoration(labelText: "Amount"),controller: amountController, keyboardType: TextInputType.number),
               Container(
                 height: 70,
                 child: Row(
                   children: <Widget>[
                     Text(_selectedDate == null ? 'No Data Chosen!' : "Picked Date : ${DateFormat.yMd().format(_selectedDate)}" ,style: TextStyle(fontSize: 15,),),
                     FlatButton(

                       textColor: Theme.of(context).primaryColor,
                       child: Text("Choose Date", style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 16 ),),
                       onPressed: _presentDatePicker,
                     )
                   ],
                 ),
               ),
               RaisedButton(onPressed: (){
                 if((titleController.text).isEmpty||(amountController.text).isEmpty || _selectedDate == null){
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
                 widget.addTx(titleController.text,double.parse(amountController.text),_selectedDate);}
               },
               child:Text("Add Transaction", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 15.0 ),),
               textColor: Theme.of(context).primaryColor,
               color: Theme.of(context).primaryColor,)
             ],
           ),
         )
     );
   }
}
