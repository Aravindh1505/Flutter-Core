import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_core/utils/utils.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
                onPressed: () {

                },
                child: const Text('Click'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
