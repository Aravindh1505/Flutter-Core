import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String dayOfWeek;
  final int amount;
  final int percentage;

  const ChartBar(this.dayOfWeek, this.amount, this.percentage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(dayOfWeek),

      ],
    );
  }
}
