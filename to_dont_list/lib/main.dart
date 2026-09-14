// Started with https://docs.flutter.dev/development/ui/widgets-intro
import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/recipe.dart';
import 'package:to_dont_list/widgets/recipe_card.dart';
import 'package:to_dont_list/widgets/recipe_dialog.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  final List<Recipe> recipes = [
    const Recipe(
        name: "Toast",
        ingredients: ["bread", "butter"],
        cookTime: 5,
        category: "Breakfast"),
  ];

  final _favorites = <Recipe>{};

  void _handleRecipeTap(Recipe recipe) {
    setState(() {
      if (_favorites.contains(recipe)) {
        _favorites.remove(recipe);
      } else {
        _favorites.add(recipe);
      }
    });
  }

  void _handleDeleteRecipe(Recipe recipe) {
    setState(() {
      recipes.remove(recipe);
    });
  }

  void _handleNewRecipe(String name, String category, int cookTime) {
    setState(() {
      recipes.insert(
          0,
          Recipe(
              name: name,
              ingredients: const [],
              cookTime: cookTime,
              category: category));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Recipes'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: recipes.map((recipe) {
          return RecipeCard(
            recipe: recipe,
            onTap: _handleRecipeTap,
            onDelete: _handleDeleteRecipe,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return RecipeDialog(onRecipeAdded: _handleNewRecipe);
                });
          }),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'My Recipes',
    home: RecipeList(),
  ));
}