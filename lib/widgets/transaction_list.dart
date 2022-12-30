import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  const TransactionList(this.transactions, this.deleteTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: transactions.isEmpty
          ? Container(
              margin: const EdgeInsets.all(50.0),
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(
                'assets/images/waiting.png',
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    child: Text(
                      '\$ ${transactions[index].amount}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    DateFormat().format(transactions[index].date),
                  ),
                  trailing: IconButton(icon: Icon(Icons.delete), color: Colors.red, onPressed: () {
                    deleteTransaction(transactions[index]);
                  }),
                );
              },
              itemCount: transactions.length),
    );
  }
}
