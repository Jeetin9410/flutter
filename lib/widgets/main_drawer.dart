import 'package:flutter/material.dart';
import 'package:flutter_first_project/screens/categories_screen.dart';
import 'package:flutter_first_project/screens/favorites_screen.dart';
import 'package:flutter_first_project/screens/meals_details_screen.dart';
import '../screens/filters_screen.dart';
import '../screens/bottom_tabs_screen.dart';
class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text("Cooking Up!",style: TextStyle(fontFamily: "Overpass",fontStyle: FontStyle.normal,fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),

          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.restaurant,size: 26,),
            title: Text("Meals",style: TextStyle(fontFamily: "Overpass",fontStyle: FontStyle.normal,fontSize: 18)),
            onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_){
                        return BottomTabsScreen();
                      }));
            },
          ),
          ListTile(
              leading: Icon(Icons.settings,size: 26,),
            title: Text("Filters",style: TextStyle(fontFamily: "Overpass",fontStyle: FontStyle.normal,fontSize: 18),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return FiltersScreen();
              }));
            },
          )

        ],
      ),
    );
  }
}
