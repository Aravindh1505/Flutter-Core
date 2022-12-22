import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;

  const Result(this.score, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Your score is: $score',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
