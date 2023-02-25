import 'package:flutter/material.dart';

import '../widgets/adaptive_progress.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: AdaptiveProgress(),
      ),
    );
  }
}
