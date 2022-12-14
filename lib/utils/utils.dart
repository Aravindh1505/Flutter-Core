import 'package:flutter/foundation.dart';

class Utils {
   static void printLog(String msg) {
    if (kDebugMode) {
      print(msg);
    }
  }
}
