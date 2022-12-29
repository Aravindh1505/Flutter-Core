import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions, {super.key});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      var weekDay = DateTime.now().subtract(Duration(days: index));
      var total = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        var day = recentTransactions[i].date.day;
        var month = recentTransactions[i].date.month;
        var year = recentTransactions[i].date.year;

        if (day == weekDay.day && month == weekDay.month && year == weekDay.year) {
          total += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'total': total};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          ...groupedTransactions.map((tx) {
            return Text(tx['day'] as String);
          }).toList(),
        ],
      ),
    );
  }
}
