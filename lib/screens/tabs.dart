import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/providers/favourite_meal_provider.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meals_screen.dart';

import '../models/meal.dart';
import '../providers/meals_provider.dart';
import '../widgets/main_drawer.dart';
import 'categoriesScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';


class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return TabState();
  }
}

class TabState extends ConsumerState<TabsScreen> {
  int activeScreenIndex = 0;

  void _setActiveScreenIndex(int index) {
    setState(() {
      activeScreenIndex = index;
    });
  }

  void _onSelectedScreen(String selectedScreen) async {
    Navigator.of(context).pop();
    if (selectedScreen == 'filters') {
      await Navigator.of(context).push<Map<Filters, bool>>(
          MaterialPageRoute(builder: (context) => const FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var availableMeals = ref.watch(filteredMealsProvider);
    Widget activeScreen = CategoriesScreen(
      availableMeals: availableMeals,
    );
    String dynamicTitle = "Categories";

    final favouriteMeals = ref.watch(favouriteMealProvider);
    if (activeScreenIndex == 1) {
      activeScreen = MealsScreen(meals: favouriteMeals);
      dynamicTitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(dynamicTitle),
      ),
      drawer: MainDrawer(
        onSelectedScreen: _onSelectedScreen,
      ),
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
