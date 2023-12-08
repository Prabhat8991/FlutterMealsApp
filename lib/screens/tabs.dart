import 'package:flutter/material.dart';
import 'package:meals/screens/meals_screen.dart';

import 'categoriesScreen.dart';

class TabsScreen extends StatefulWidget {

  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return TabState();
  }
}

class TabState extends State {

  int activeScreenIndex = 0;
  void _setActiveScreenIndex(int index) {
    setState(() {
      activeScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget activeScreen = const CategoriesScreen();
    String dynamicTitle = "Categories";

    if (activeScreenIndex == 1) {
      activeScreen = const MealsScreen(title: "Favourites", meals: []);
      dynamicTitle = "Favorites";
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(dynamicTitle),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setActiveScreenIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites")
        ],
      ),
    );
  }
}