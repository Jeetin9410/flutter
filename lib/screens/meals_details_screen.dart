import 'package:flutter/material.dart';
import 'package:flutter_first_project/dummy-data.dart';
class MealsDetails extends StatelessWidget {
  String mealsId;
  MealsDetails(this.mealsId);
  @override
  Widget build(BuildContext context) {

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealsId);

    final appBar = AppBar(
        title: Text("${selectedMeal.title}"),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
       children: <Widget>[
         Container(
           height: 300,
           width: double.infinity,
           child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),
         ),
         Card(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15),

           ),
           child: Container(
             decoration: BoxDecoration(
                 color: Colors.white,
                 border: Border.all(color: Colors.grey),
                 borderRadius: BorderRadius.circular(15)
             ),
             child: Column(
               children: <Widget>[
                 Container(
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Text("Ingredients",style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,fontFamily: "Overpass",fontSize: 18),),
                   ),
                 ),
                 Container(

                   height: (MediaQuery.of(context).size.height - appBar.preferredSize.height
                       - MediaQuery.of(context).padding.top)*0.3,
                   width: (MediaQuery.of(context).size.width),
                   child:
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: ListView.builder(
                       itemBuilder: (ctx,index) => Card(
                         child: Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                           child: Text(selectedMeal.ingredients[index]),
                         ),
                       ),
                       itemCount: selectedMeal.ingredients.length,),
                   ),
                 ),
               ],
             ),
           ),
         ),
       ],
      ),
    );
  }
}
