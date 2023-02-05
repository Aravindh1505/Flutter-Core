import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';

class CustomDialogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.getAppBar(context, 'Custom Dialogs'),
      body: Builder(
        builder: (ctx) => Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 5),
                      content: Text('Hey, There!'),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          print('Undo clicked!');
                        },
                      ),
                    ),
                  );
                },
                child: Text(
                  'Show Toast',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: true,
                    useSafeArea: true,
                    context: ctx,
                    builder: (ct) => AlertDialog(
                      title: Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
                      content: Text('Are you sure you want to Delete?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            print('No Clicked!');
                            Navigator.of(ct).pop();
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            print('Yes Clicked!');
                            Navigator.of(ct).pop();
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                  'Open Dialog',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
