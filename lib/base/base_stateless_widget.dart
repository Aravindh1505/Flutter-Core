import 'package:flutter/material.dart';

class BaseStateLessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static void LOG(String message) {
    print(message);
  }
}
