import 'package:flutter/material.dart';
import 'package:flutter_core/widgets/new_transaction.dart';
import 'package:flutter_core/widgets/transaction_list.dart';

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

  void showNewTransactionSheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  void _addTransaction(String title, double amount) {
    if (title.isEmpty || amount <= 0) {
      return;
    }

    var newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      transactions.add(newTransaction);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            TransactionList(transactions),
          ],
        ),
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
