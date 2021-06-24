
  import 'package:flutter/material.dart';
import 'package:meals/model/Meal.dart';
import 'package:meals/widgets_model/meal_item.dart';
  class FavouritesScreen extends StatelessWidget {
    static const routeName = "/favourites-screen";

    final List<Meal> favouriteMeals;
    FavouritesScreen(this.favouriteMeals);

    @override
    Widget build(BuildContext context) {
      if (favouriteMeals.isEmpty) {
        return Center(
          child: Text("You have no favorites yet"),
        );
      } else {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                favouriteMeals[index].id,
                favouriteMeals[index].title,
                favouriteMeals[index].imageUrl,
                favouriteMeals[index].duration,
                favouriteMeals[index].complexity,
                favouriteMeals[index].affordAbility,
                () {});
          },
          itemCount: favouriteMeals.length,
        );
      }

    }
  }
