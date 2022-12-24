import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_core/utils/utils.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widget Styling'),
        ),
      ),
    );
  }
}
