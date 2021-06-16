import 'package:flutter/material.dart';
import 'package:meals/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(String title, IconData icon, Function() tabHandle) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: tabHandle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text("Cooking up!",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTitle("Meals", Icons.restaurant, () {
            Navigator.of(context).pushNamed("/");
          }),
          buildListTitle("Filters", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FillterScreen.routeName);
          })
        ],
      ),
    );
  }
}
