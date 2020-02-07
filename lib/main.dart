import 'package:flutter/material.dart';
import 'package:flutter_first_project/screens/products_overview_screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "MyShop",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Lato'
      ),
      home: ProductsOverviewScreen(),
    );

  }
  
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text("MyShop"),
     ),
     body: Center(
       child: Text("Hi"),
     ),
   );
  }

}
