import 'package:flutter/material.dart';
import 'package:meals/widgets_model/main_drawer.dart';

class FillterScreen extends StatefulWidget {
  static const routeName = "/filter-screen";

  @override
  _FillterScreenState createState() => _FillterScreenState();
}

class _FillterScreenState extends State<FillterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTitle(String title, String description, bool currentValue, Function(bool)? updateValue) {
    return SwitchListTile(title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Screen"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme
                  .of(context)
                  .textTheme
                  .title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTitle("Gluten-free", "Only include gluten-free", _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTitle("Lactose-free", "Only include Lactose meals", _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTitle("Vegetarian", "Only include Vegetarian meals", _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTitle("Vegan", "Only include Vegan meals", _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                })

              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
