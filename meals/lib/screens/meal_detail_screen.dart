import 'package:flutter/material.dart';
import 'package:meals/model/Meal.dart';
import 'package:meals/screens/favourites_screen.dart';
import 'package:meals/ultis/dummy_data.dart';
import 'package:meals/widgets_model/meal_item.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme
            .of(context)
            .textTheme
            .title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routeAgrs =
    ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, String>;
    final mealId = routeAgrs["id"] as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    }) as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) =>
                      Card(
                        color: Theme
                            .of(context)
                            .accentColor,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(selectedMeal.ingredients[index])),
                      )),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) =>
                    ListTile(
                      leading: CircleAvatar(

                      ),
                      title: Text(selectedMeal.steps[index]),
                    )))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
