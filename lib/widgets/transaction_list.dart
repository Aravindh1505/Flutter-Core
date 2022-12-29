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
      height: 600,
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
                /* return SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Card(
                    elevation: 5.0,
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            width: 50.0,
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
                );*/
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
