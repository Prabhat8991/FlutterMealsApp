import 'package:flutter/material.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({super.key, this.title, required this.meals, required this.toggleFavouriteMeal});

  final String? title;
  final List<Meal> meals;
  void Function(Meal meal) toggleFavouriteMeal;

  void _onMealsItemSelected(BuildContext context, Meal meal) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal, toggleFavouriteMeal: toggleFavouriteMeal,)));
  }

  @override
  Widget build(BuildContext context) {
    Widget? body;

    if (meals.isEmpty) {
      body = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Oh oh.... nothing here",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Please select another category",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ],
        ),
      );
    } else {
      body = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(meal: meals[index], onMealItemSelected: (meal){
          _onMealsItemSelected(context, meal);
        },),
      );
    }
    if(title == null) {
      return body;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: body,
    );
  }
}
