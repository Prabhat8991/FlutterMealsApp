import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/category_grid_item.dart';

import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class CategoriesScreen extends StatelessWidget {

   CategoriesScreen({super.key, required this.toggleFavouriteMeal});

  void Function(Meal meal) toggleFavouriteMeal;

  void _onCategorySelected(BuildContext context, Category category) {
    List<Meal> filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) =>
                MealsScreen(title: category.title, meals: filteredMeals, toggleFavouriteMeal: toggleFavouriteMeal,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick a category"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2),
        children: availableCategories
            .map((category) => CategoryGridItem(
                  category: category,
                  onCategorySelected: () {
                    _onCategorySelected(context, category);
                  },
                ))
            .toList(),
      ),
    );
  }
}
