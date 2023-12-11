import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavouriteStateNotifier extends StateNotifier<List<Meal>> {
  FavouriteStateNotifier(): super([]);

  bool toggleFavouriteMeal(Meal meal) {
    if(state.contains(meal)) {
      state = state.where((mealItem) => mealItem.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }

}

var favouriteMealProvider = StateNotifierProvider<FavouriteStateNotifier, List<Meal>>((ref) {
  return FavouriteStateNotifier();
});