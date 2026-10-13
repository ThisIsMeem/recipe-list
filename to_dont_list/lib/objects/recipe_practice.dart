import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/recipe.dart';

typedef RecipeCardTapCallback = Function(Recipe recipe);

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    required this.recipe,
    required this.onTap,
    required this.onDelete,
  });

  final Recipe recipe;
  final RecipeCardTapCallback onTap;
  final RecipeCardTapCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(recipe);
      },
      onLongPress: () {
        onDelete(recipe);
      },
      leading: CircleAvatar(
        child: Text('${recipe.ingredients.length}'),
      ),
      title: Text(recipe.name),
      subtitle: Text('${recipe.cookTime} - ${recipe.category}'),
    );
  }
}
