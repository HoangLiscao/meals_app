import 'package:flutter/material.dart';
import 'package:meals/model/Meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favourites_screen.dart';
import 'package:meals/widgets_model/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {"page": CategoriesScreen(), "title": "Categories"},
      {
        "page": FavouritesScreen(widget.favouriteMeals),
        "title": "Your favourites"
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme
            .of(context)
            .accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme
                  .of(context)
                  .primaryColor,
              icon: Icon(Icons.category),
              title: Text("Category")),
          BottomNavigationBarItem(
              backgroundColor: Theme
                  .of(context)
                  .primaryColor,
              icon: Icon(Icons.star),
              title: Text("Favourites"))
        ],
      ),
    );
  }
}
