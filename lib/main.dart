import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/categories_meals_screen.dart';
import '../screens/meal_details_screen.dart';
import '../screens/tabs_screen.dart';
import '../utils/route_names.dart';
import '../screens/filters_screen.dart';
import '../models/meal_filters.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _mealFilters = MealFilters(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  );

  List<Meal> _meals = DUMMY_MEALS;

  void _submitFilters(MealFilters mealFilters) {
    setState(() {
      _mealFilters = mealFilters;

      _meals = DUMMY_MEALS.where((meal) {
        if (_mealFilters.isGlutenFree && !meal.isGlutenFree) {
          return false;
        }
        if (_mealFilters.isLactoseFree && !meal.isLactoseFree) {
          return false;
        }
        if (_mealFilters.isVegan && !meal.isVegan) {
          return false;
        }
        if (_mealFilters.isVegetarian && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    //Utils.logger('Main build...');
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
        accentColor: Colors.pinkAccent,
        fontFamily: GoogleFonts.abrilFatface().fontFamily,
        textTheme: buildTextTheme(),
      ),
      routes: {
        RouteNames.HOME: (_) => const TabsScreen(),
        RouteNames.CATEGORIES_MEALS: (_) => CategoryMealsScreen(_meals),
        RouteNames.MEAL_DETAIL: (_) => const MealDetailScreen(),
        RouteNames.FILTERS: (_) => FiltersScreen(_mealFilters, _submitFilters),
      },
    );
  }

  TextTheme buildTextTheme() {
    return ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
            fontFamily: GoogleFonts.abrilFatface().fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 24.0,
          ),
          titleMedium: TextStyle(
            fontFamily: GoogleFonts.abrilFatface().fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
          bodySmall: TextStyle(
            fontFamily: GoogleFonts.abrilFatface().fontFamily,
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        );
  }
}
