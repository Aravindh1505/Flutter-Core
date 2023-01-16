import 'package:flutter/material.dart';

import '../models/category.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  /* final Category category;
  const CategoryMealsScreen(this.category, {super.key});
  */

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = DUMMY_MEALS.where((element) => element.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: category.color,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
