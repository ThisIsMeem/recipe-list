import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/recipe.dart';

typedef RecipeCardTapCallback = Function(Recipe recipe);

class RecipeCard extends StatelessWidget {
  RecipeCard({
    required this.recipe,
    required this.onTap,
    required this.onDelete,
  }) : super(key: ObjectKey(recipe));

  final Recipe recipe;
  final RecipeCardTapCallback onTap;
  final RecipeCardTapCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {
        onTap(recipe);
      },
      onLongPress: () {
        onDelete(recipe);
      },
      leading: CircleAvatar(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        child: Text('${recipe.cookTime}'),
      ),
      title: Text(recipe.name, style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),),
      subtitle: Text('${recipe.category} - ${recipe.ingredients} ingredients'),
    );
  }
}
