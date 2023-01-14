import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoriesItem extends StatelessWidget {
  final Category category;

  const CategoriesItem(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [category.color.withOpacity(0.7), category.color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(category.title, textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.titleLarge,),
    );
  }
}
