import 'package:flutter/material.dart';

import '../widgets/chart.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';
import '../utils/utils.dart';

void main() => runApp(
      MaterialApp(
        home: MyApp(),
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'OpenSans',
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> transactions = Utils.transactions;

  List<Transaction> get _recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void showNewTransactionSheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  void _addTransaction(String title, double amount, DateTime dateTime) {
    if (title.isEmpty || amount <= 0) {
      return;
    }

    var newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: dateTime,
    );

    setState(() {
      transactions.add(newTransaction);
    });
  }

  void _deleteTransaction(Transaction transaction) {
    setState(() {
      transactions.remove(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Styling'),
        actions: [
          IconButton(
              onPressed: () {
                showNewTransactionSheet(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Chart(_recentTransactions),
          TransactionList(transactions, _deleteTransaction),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showNewTransactionSheet(context);
        },
      ),
    );
  }
}
