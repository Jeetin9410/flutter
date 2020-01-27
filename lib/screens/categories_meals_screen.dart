import 'package:flutter/material.dart';
import 'package:flutter_first_project/dummy-data.dart';
import 'package:flutter_first_project/widgets/meal_item.dart';
class CategoryMealsScreen extends StatelessWidget { final String categoryId;
final String categoryTitle;

CategoryMealsScreen(this.categoryId, this.categoryTitle);

@override
Widget build(BuildContext context) {
  final categoryMeals = DUMMY_MEALS.where((meal){
    return meal.categories.contains(categoryId);
  }).toList();

  return Scaffold(
    appBar: AppBar(
      title: Text(categoryTitle),
    ),
    body: ListView.builder(itemBuilder: (ctx, index){
      return MealItem(
        id: categoryMeals[index].id,
        title: categoryMeals[index].title,
      imageUrl: categoryMeals[index].imageUrl,
      duration: categoryMeals[index].duration,
      affordability: categoryMeals[index].affordability,
      complexity: categoryMeals[index].complexity,
      );
    },
    itemCount: categoryMeals.length,)
  );
}
}