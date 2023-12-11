import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meals_provider.dart';

enum Filters { lactoseFree, glutenFree, vegan, vegetarian }

class FilterNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterNotifier() : super({
    Filters.lactoseFree: false,
    Filters.vegan: false,
    Filters.vegetarian: false,
    Filters.glutenFree: false
  });

  void setFilters(Map<Filters, bool> newMap) {
   state = newMap;
  }

  void setFilter(Filters filter, bool value) {
    state = {...state,
      filter: value
    };
  }
}

final filterNotifierProvider = StateNotifierProvider<FilterNotifier,
    Map<Filters, bool>>((ref) {
  return FilterNotifier();
});

var filteredMealsProvider = Provider((ref) {
  var meals = ref.watch(mealsProvider);
  var activeFilters = ref.watch(filterNotifierProvider);
  return meals.where((meal) {
    if (activeFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }

    if (activeFilters[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }

    if (activeFilters[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});