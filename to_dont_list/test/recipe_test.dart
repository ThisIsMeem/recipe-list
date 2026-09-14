import 'package:flutter_test/flutter_test.dart';
import 'package:to_dont_list/objects/recipe.dart';

void main() {
  test('Recipe stores its values correctly', () {
    const recipe = Recipe(
        name: "Pasta",
        ingredients: ["flour", "eggs"],
        cookTime: 20,
        category: "Dinner");

    expect(recipe.name, "Pasta");
    expect(recipe.cookTime, 20);
    expect(recipe.category, "Dinner");
  });

  test('ingredientCount returns the number of ingredients', () {
    const recipe = Recipe(
        name: "Pasta",
        ingredients: ["flour", "eggs"],
        cookTime: 20,
        category: "Dinner");

    expect(recipe.ingredientCount(), 2);
  });

  test('ingredientCount is 0 for an empty ingredient list', () {
    const recipe = Recipe(
        name: "Water",
        ingredients: [],
        cookTime: 0,
        category: "Drink");

    expect(recipe.ingredientCount(), 0);
  });
}