
  import 'package:flutter/material.dart';
import 'package:meals/model/Meal.dart';
  class FavouritesScreen extends StatelessWidget {
    static const routeName = "/favourites-screen";

    final List<Meal> favouriteMeals;
    FavouritesScreen(this.favouriteMeals);

    @override
    Widget build(BuildContext context) {
      return Center(
        child: Text("You have no favorites yet"),
      );
    }
  }
