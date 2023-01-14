import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The receipes'),
      ),
      body: Center(
        child: Text('Welcome to meals screen!'),
      ),
    );
  }
}
