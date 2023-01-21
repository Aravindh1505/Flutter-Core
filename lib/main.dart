import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/categories_meals_screen.dart';
import '../screens/meal_details_screen.dart';
import '../screens/tabs_screen.dart';
import '../utils/route_names.dart';
import '../screens/filters_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Utils.logger('Main build...');
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
        accentColor: Colors.white,
        fontFamily: GoogleFonts.lato().fontFamily,
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: TextStyle(
                fontFamily: GoogleFonts.lato().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
              ),
              titleMedium: TextStyle(
                fontFamily: GoogleFonts.lato().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
              bodySmall: TextStyle(
                fontFamily: GoogleFonts.lato().fontFamily,
                fontWeight: FontWeight.w300,
                fontSize: 16.0,
              ),
            ),
      ),
      routes: {
        RouteNames.HOME: (_) => const TabsScreen(),
        RouteNames.CATEGORIES_MEALS: (_) => const CategoryMealsScreen(),
        RouteNames.MEAL_DETAIL: (_) => const MealDetailScreen(),
        RouteNames.FILTERS: (_) => const FiltersScreen(),
      },
    );
  }
}
