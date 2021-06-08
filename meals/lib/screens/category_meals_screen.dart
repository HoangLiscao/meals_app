import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/ultis/dummy_data.dart';
import 'package:meals/widgets_model/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";

  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeAgrs = ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, String>;
    final categoryId = routeAgrs["id"];
    final categoryTitle = routeAgrs["title"];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(categoryMeals[index].title, categoryMeals[index].imageUrl, categoryMeals[index].duration, categoryMeals[index].complexity, categoryMeals[index].affordAbility);
        }, itemCount: categoryMeals.length,
      ),
    );
  }
}
