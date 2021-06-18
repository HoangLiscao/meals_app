
import 'package:flutter/material.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/favourites_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/ultis/dummy_data.dart';
import 'model/Meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filter = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _avaiableMeal = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _avaiableMeal = DUMMY_MEALS.where((element) {
        if (_filter["gluten"]! && !element.isGlutenFree) {
          return false;
        }
        if (_filter["lactose"]! && !element.isLactoseFree) {
          return false;
        }
        if (_filter["vegan"]! && !element.isVegan) {
          return false;
        }
        if (_filter["vegetarian"]! && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =  _favouriteMeals.indexWhere((element) => element.id == mealId);

    if (existingIndex >= 0){
      setState(() {
        _favouriteMeals.remove(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hoang meals',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.pinkAccent,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(fontSize: 20, fontFamily: "RobotoCondensed", fontWeight: FontWeight.bold)),),
      // home: CategoriesScreen(),
      routes: {
        "/" : (context) => TabsScreen(_favouriteMeals),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_avaiableMeal),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavourite, _isMealFavourite),
        FillterScreen.routeName: (context) => FillterScreen(() =>_setFilters)
      },
      onGenerateRoute: (setting) {
        print (setting.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen(_avaiableMeal));
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (context) => CategoryMealsScreen(_avaiableMeal));
      },

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DeliMeals"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
