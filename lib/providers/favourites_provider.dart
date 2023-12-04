import 'package:meals_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavouritesMealsNotifier() : super([]);
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite =
        state.contains(meal); //.add & .remove cant be used in statenotifier

    if (mealIsFavorite) {
      state = state
          .where((m) => m.id != meal.id)
          .toList();
          return false; //where gives a new list //removes
    } else {
      state = [...state, meal];
      return true;
    }
    
  }
}

final favouritesMealProvider =
    StateNotifierProvider<FavouritesMealsNotifier, List<Meal>>((ref) {
  return FavouritesMealsNotifier();
});
