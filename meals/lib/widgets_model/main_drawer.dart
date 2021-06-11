import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        //todo
      },
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
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(5)),
            child: Text("Cooking up!",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTitle("Meals", Icons.restaurant),
          buildListTitle("Filters", Icons.settings)
        ],
      ),
    );
  }
}
