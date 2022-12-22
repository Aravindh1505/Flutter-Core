import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback answerQuestion;
  final String answer;

  const Answer(this.answerQuestion, this.answer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
        onPressed: answerQuestion,
        child: Text(answer),
      ),
    );
  }
}
