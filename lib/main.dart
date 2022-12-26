import 'package:flutter/material.dart';
import 'package:flutter_core/widgets/user_transactions.dart';

import './widgets/user_transactions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widget Styling'),
        ),
        body: Column(
          children: [UserTransaction()],
        ),
      ),
    );
  }
}
