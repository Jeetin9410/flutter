import 'package:flutter/material.dart';
import 'package:flutter_first_project/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree =false;
  bool _vegan =false;
  bool _vegetarian =false;
  bool _lactoseFree =false;

Widget _buildSwitchItem(String title, String description, bool currentValue, Function updateValue){
  return SwitchListTile(
    title: Text(title),
    value: currentValue,
    subtitle: Text(description),
    onChanged: updateValue
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters",style: Theme.of(context).textTheme.title,),),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection",style: Theme.of(context).textTheme.title,),
          ),
          Expanded(child: ListView(
            children: <Widget>[
              _buildSwitchItem("Gluten-Free", "Only include Gluten free meals ", _glutenFree, (newValue){
                setState(() {
                  _glutenFree=newValue;
                });
              }),
              _buildSwitchItem("Lactose-Free", "Only include Lactose free meals ", _lactoseFree, (newValue){
                setState(() {
                  _lactoseFree=newValue;
                });
              }),
              _buildSwitchItem("Vegetarian", "Only include Vegetarian meals ", _vegetarian, (newValue){
                setState(() {
                  _vegetarian=newValue;
                });
              }),
              _buildSwitchItem("Vegas", "Only include Vegas meals ", _vegan, (newValue){
                setState(() {
                  _vegan=newValue;
                });
              }),
            ],
          ))
        ],
      )
    );
  }
}
