import 'package:flutter/foundation.dart';

import '../models/transaction.dart';

class Utils {
  static void printLog(String msg) {
    if (kDebugMode) {
      print(msg);
    }
  }

  static final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Mobile',
      amount: 99.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Recharge',
      amount: 35.00,
      date: DateTime.now(),
    )
  ];
}
