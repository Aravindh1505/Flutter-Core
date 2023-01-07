import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Size in physical pixels
    var physicalScreenSize = window.physicalSize;
    var width = physicalScreenSize.width;
    var height = physicalScreenSize.height;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Smart Illam'),
        ),
        body: Container(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Click'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
