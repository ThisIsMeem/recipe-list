import 'package:flutter/material.dart';

typedef RecipeAddedCallback = Function(String name, String category, int cookTime);

class RecipeDialog extends StatelessWidget {
  RecipeDialog({super.key, required this.onRecipeAdded});

  final RecipeAddedCallback onRecipeAdded;

  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final cookTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a Recipe'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'Recipe name'),
          ),
          TextField(
            controller: categoryController,
            decoration: const InputDecoration(hintText: 'Category'),
          ),
          TextField(
            controller: cookTimeController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Cook time (minutes)'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final name = nameController.text;
            final category = categoryController.text;
            final cookTime = int.tryParse(cookTimeController.text) ?? 0;
            onRecipeAdded(name, category, cookTime);
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}