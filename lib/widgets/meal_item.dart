import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(this.meal, {super.key});

  void selectedMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectedMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5.0,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 15.0,
                  right: 0,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      meal.title,
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 5.0),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 5.0),
                      Text(meal.complexity.name),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 5.0),
                      Text(meal.affordability.name),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
