import 'package:flutter/material.dart';
import 'package:flutter_poc/mealApp/data/dummy_data.dart';
import 'package:flutter_poc/mealApp/models/meal.dart';
import 'package:flutter_poc/mealApp/screen/meals.dart';
import 'package:flutter_poc/mealApp/widget/category_grid_item.dart';
import 'package:flutter_poc/mealApp/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, MealCategory category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return MealsScreen(
        title: category.title,
        meals: filteredMeals,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        /// availableCategories.map((category) => CategoryGridItem(category:category)).toList();
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
