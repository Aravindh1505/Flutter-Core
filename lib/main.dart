import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/categories_screen.dart';
import '../utils/utils.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.logger('Main build...');
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.greenAccent,
        accentColor: Colors.pink,
        fontFamily: GoogleFonts.lato().fontFamily,
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: TextStyle(
                fontFamily: GoogleFonts.lato().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
              ),
              bodySmall: TextStyle(
                fontFamily: GoogleFonts.lato().fontFamily,
                fontWeight: FontWeight.w300,
                fontSize: 16.0,
              ),
            ),
      ),
      home: CategoriesScreen(),
    );
  }
}
