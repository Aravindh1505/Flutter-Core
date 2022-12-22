import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  var questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Red', 'Green', 'Black', 'Blue']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Rabbit', 'Dog', 'Cat']
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': ['Idly', 'Dosa', 'Poori', 'Pizza']
    }
  ];

  void _answerQuestion() {
    if (questions.length - 1 > _questionIndex) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Survey'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText'] as String),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) => Answer(_answerQuestion, answer))
                .toList()
          ],
        ),
      ),
    );
  }
}
