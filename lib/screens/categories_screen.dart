import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';
import '../widgets/categories_item.dart';
import '../utils/utils.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  void selectedCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return CategoryMealsScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals App'),
      ),
      body: InkWell(
        onTap: () => selectedCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15.0),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: DUMMY_CATEGORIES.map((category) => CategoriesItem(category)).toList()),
      ),
    );
  }
}
