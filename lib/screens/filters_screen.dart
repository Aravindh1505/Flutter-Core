import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../models/meal_filters.dart';

class FiltersScreen extends StatefulWidget {
  final MealFilters mealFilters;
  final Function submit;

  const FiltersScreen(this.mealFilters, this.submit, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  /*var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;*/

  Widget _buildCustomSwitchListTile(String title, String subTitle, bool currentValue, ValueChanged<bool>? newValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: newValue,
    );
  }

  /*void _submit() {
    print('_isGlutenFree : $_isGlutenFree');
    print('_isLactoseFree : $_isLactoseFree');
    print('_isVegan : $_isVegan');
    print('_isVegetarian : $_isVegetarian');
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 350,
            child: ListView(
              children: [
                _buildCustomSwitchListTile(
                    'Gluten-Free', 'Only includes gluten free meals', widget.mealFilters.isGlutenFree, (value) {
                  setState(() {
                    widget.mealFilters.isGlutenFree = value;
                  });
                }),
                _buildCustomSwitchListTile(
                    'Lactose-Free', 'Only includes lactose free meals', widget.mealFilters.isLactoseFree, (value) {
                  setState(() {
                    widget.mealFilters.isLactoseFree = value;
                  });
                }),
                _buildCustomSwitchListTile('Vegan-Free', 'Only includes vegan free meals', widget.mealFilters.isVegan,
                    (value) {
                  setState(() {
                    widget.mealFilters.isVegan = value;
                  });
                }),
                _buildCustomSwitchListTile(
                    'Vegetarian-Free', 'Only includes vegetarian free meals', widget.mealFilters.isVegetarian, (value) {
                  setState(() {
                    widget.mealFilters.isVegetarian = value;
                  });
                }),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget.submit(widget.mealFilters);
            },
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}
