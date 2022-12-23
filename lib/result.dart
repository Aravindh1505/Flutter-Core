import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback restart;

  const Result(this.score, this.restart, {super.key});

  String get greetings {
    String result;
    if (score <= 8) {
      result = 'Good Attempt';
    } else if (score <= 15) {
      result = 'Awesome you are great';
    } else {
      result = 'You crack it Congrats!';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$greetings Your score is: $score',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: restart,
            child: const Text(
              'Restart Quiz',
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
