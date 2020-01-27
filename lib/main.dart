import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_project/screens/categories_screen.dart';
import 'package:flutter_first_project/screens/bottom_tabs_screen.dart';
void main(){
  SystemChrome.setPreferredOrientations([  // now app will always be in Portrait mode always
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.white,
          fontFamily: "Overpass",
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: "Overpass",
              fontSize: 17,
              color: Colors.white
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
      home: BottomTabsScreen(),

    );
  }
}
