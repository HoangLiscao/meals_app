import 'package:flutter/material.dart';
import 'package:meals/ultis/dummy_data.dart';
import 'package:meals/widgets_model/category_item.dart';

  class CategoriesScreen extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("DeliMeals"),)
        ,body: GridView(
        padding: EdgeInsets.all(15),
        children: DUMMY_CATEGORIES.map((categoryData) => CategoryItem(categoryData.id, categoryData.title, categoryData.color)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent (
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
        ),

      ),);
    }
  }
