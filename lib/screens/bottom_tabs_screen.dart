import 'package:flutter/material.dart';
import 'package:flutter_first_project/screens/categories_screen.dart';
import 'package:flutter_first_project/screens/favorites_screen.dart';
class BottomTabsScreen extends StatefulWidget {
  @override
  _BottomTabsScreenState createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  final List<Widget> _pages = [
    CategoriesScreen(),
    FavoritesScreen()
  ];
  int _selectedPageIndex = 0;
  void _selectedPage(int index){
setState(() {
  _selectedPageIndex = index;
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Meals"),),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).accentColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
        unselectedLabelStyle: TextStyle(color: Colors.black54),
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(backgroundColor: Theme.of(context).accentColor, icon: Icon(Icons.category),title: Text("Categories",)),
          BottomNavigationBarItem(backgroundColor: Theme.of(context).accentColor, icon: Icon(Icons.star),title: Text("Favorites"))
        ],
      ),
    );
  }
}
