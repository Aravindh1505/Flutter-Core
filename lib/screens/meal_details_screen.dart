import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            buildTile(context, 'Ingredients', meal.ingredients),
            buildTile(context, 'Steps', meal.steps),
          ],
        ),
      ),
    );
  }

  Widget buildTile(BuildContext context, String title, List<String> items) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(5.0),
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return Text(
                items[index],
                style: Theme.of(context).textTheme.bodySmall,
              );
            },
            itemCount: items.length,
          ),
        )
      ],
    );
  }
}
