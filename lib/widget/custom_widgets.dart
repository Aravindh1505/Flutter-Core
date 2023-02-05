import 'package:flutter/material.dart';

class CustomWidgets {
  static AppBar getAppBar(BuildContext context, String title) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static showAlertDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Okay'))
        ],
      ),
    );
  }
}
