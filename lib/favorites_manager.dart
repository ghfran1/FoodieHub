import 'meal_model.dart';


List<Meal> favoriteMeals = [];


void addToFavorites(Meal meal) {
  if (!favoriteMeals.contains(meal)) {
    favoriteMeals.add(meal);
  }
}

void removeFromFavorites(Meal meal) {
  favoriteMeals.remove(meal);
}

bool isFavorite(Meal meal) {
  return favoriteMeals.contains(meal);
}