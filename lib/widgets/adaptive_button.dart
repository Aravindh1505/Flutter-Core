import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '/base.dart';

class AdaptiveButton extends StatelessWidget with Base {
  final String title;
  final VoidCallback callback;

  AdaptiveButton({super.key, required this.title, required this.callback});

  @override
  Widget build(BuildContext context) {
    return isIOS
        ? CupertinoButton.filled(
            onPressed: callback,
            child: Text(title),
          )
        : ElevatedButton(
            onPressed: callback,
            child: Text(title),
          );
  }
}
