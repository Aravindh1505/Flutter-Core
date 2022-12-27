import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: transactions.isEmpty
          ? Image.asset('assets/images/waiting.png')
          : ListView.builder(
              itemBuilder: (context, index) {
                return SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Card(
                    elevation: 5.0,
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            child: Text('\$ ${transactions[index].amount.toStringAsFixed(2)}',
                                style: TextStyle(color: Theme.of(context).primaryColor)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15.0),
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transactions[index].title,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  DateFormat().format(transactions[index].date),
                                  style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length),
    );
  }
}
