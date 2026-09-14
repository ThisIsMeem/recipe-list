import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_dont_list/objects/recipe.dart';
import 'package:to_dont_list/widgets/recipe_card.dart';

void main() {
  testWidgets('RecipeCard displays the recipe name and details',
      (WidgetTester tester) async {
    const recipe = Recipe(
        name: "Pasta",
        ingredients: ["flour", "eggs"],
        cookTime: 20,
        category: "Dinner");

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: RecipeCard(
          recipe: recipe,
          onTap: (Recipe recipe) {},
          onDelete: (Recipe recipe) {},
        ),
      ),
    ));

    expect(find.text('Pasta'), findsOneWidget);
    expect(find.text('Dinner - 2 ingredients'), findsOneWidget);
  });

  testWidgets('Tapping a RecipeCard calls onTap',
      (WidgetTester tester) async {
    const recipe = Recipe(
        name: "Pasta",
        ingredients: ["flour", "eggs"],
        cookTime: 20,
        category: "Dinner");

    bool tapped = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: RecipeCard(
          recipe: recipe,
          onTap: (Recipe recipe) {
            tapped = true;
          },
          onDelete: (Recipe recipe) {},
        ),
      ),
    ));

    await tester.tap(find.byType(ListTile));
    expect(tapped, true);
  });
}