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
            buildTile(
              context,
              'Ingredients',
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      '* ${meal.ingredients[index]}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            buildTile(
              context,
              'Steps',
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(meal.steps[index]),
                      ),
                      const Divider(thickness: 1.0),
                    ],
                  );
                },
                itemCount: meal.steps.length,
              ),
            ),
            //buildTile(context, 'Steps', meal.steps),
          ],
        ),
      ),
    );
  }

  Widget buildTile(BuildContext context, String title, Widget child) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pinkAccent, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: child)
      ],
    );
  }
}
