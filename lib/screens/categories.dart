import 'package:flutter/material.dart';
import 'package:meal_app_project/data/dummy.dart';
import 'package:meal_app_project/models/category.dart';
import 'package:meal_app_project/screens/meals.dart';
import 'package:meal_app_project/widgets/category_grid_item.file.dart';

import '../models/meal.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggelFavorite, required this.availableMeals});

  final void Function(Meal meal) onToggelFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggelFavorite: onToggelFavorite,
        ),
      ),
    ); //Navigator.push(context,route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: [
          for (final category in availableCategories)
            CategorryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                })
          // Text('1',style: TextStyle(color: Colors.white),),
          // Text('2',style: TextStyle(color: Colors.white),),
          // Text('3',style: TextStyle(color: Colors.white),),
          // Text('4',style: TextStyle(color: Colors.white),),
          // Text('5',style: TextStyle(color: Colors.white),),
          // Text('6',style: TextStyle(color: Colors.white),),
        ],
      );

  }
}
// Scaffold(
// appBar: AppBar(
// title: const Text('Pick Your Categories'),
// ),
// body: