import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? buildMaterialApp() : buildCupertinoApp();
  }

  MaterialApp buildMaterialApp() {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Smart Home'),
        ),
        body: buildBody,
      ),
    );
  }

  CupertinoApp buildCupertinoApp() {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Smart Home'),
        ),
        child: buildBody,
      ),
    );
  }

  final buildBody = Column(
    children: [
      Platform.isIOS
          ? CupertinoButton(
              onPressed: () {},
              child: Text('Submit'),
            )
          : ElevatedButton(
              onPressed: () {},
              child: Text('Submit'),
            ),
    ],
  );
}
