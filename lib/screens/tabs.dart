import 'package:flutter/material.dart';
import 'package:meals/screens/meals_screen.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
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
  List<Meal> favouriteMeals = [];

  void _setActiveScreenIndex(int index) {
    setState(() {
      activeScreenIndex = index;
    });
  }

  void _onSelectedScreen(String selectedScreen) {
    if (selectedScreen == 'filters') {
    } else {
      Navigator.of(context).pop();
    }
  }

  void toggleFavouriteMeal(Meal meal) {
    bool isExisting = favouriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        favouriteMeals.remove(meal);
        _showMessage("Meal no longer favourite");
      });
    } else {
      setState(() {
        favouriteMeals.add(meal);
        _showMessage("Meal is marked as favourite");
      });
    }
  }

  void _showMessage(String messgae) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(messgae)));
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      toggleFavouriteMeal: toggleFavouriteMeal,
    );
    String dynamicTitle = "Categories";

    if (activeScreenIndex == 1) {
      activeScreen = MealsScreen(
        meals: favouriteMeals,
        toggleFavouriteMeal: toggleFavouriteMeal,
      );
      dynamicTitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(dynamicTitle),
      ),
      drawer: MainDrawer(onSelectedScreen: _onSelectedScreen,),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setActiveScreenIndex,
        currentIndex: activeScreenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites")
        ],
      ),
    );
  }
}
