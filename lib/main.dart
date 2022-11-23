import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_core/utils/utils.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size in physical pixels
    var physicalScreenSize = window.physicalSize;
    var width = physicalScreenSize.width;
    var height = physicalScreenSize.height;

    Utils.printLog('device width :$width');
    Utils.printLog('device height :$height');

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
                  postService();
                },
                child: const Text('Click'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getService() async {
    Utils.printLog('hitService Clicked!');
    //var url = Uri.https('https://flutter-shop-app-cbef4.firebaseio.com/products.json');

    var url =
        Uri.https('www.gorest.co.in', '/public/v2/posts', {'q': '{http}'});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      Utils.printLog('response success : ${response.statusCode}');
      Utils.printLog('response body : ${response.body}');
    } else {
      Utils.printLog('response failure : ${response.statusCode}');
    }
  }


  Future<void> postService() async {
    Utils.printLog('postService Clicked!');

    var url = Uri.https('gorest.co.in', '/public/v2/users');

    var response = await http.post(url,
        headers: <String, String>{
          'Authorization':
              'Bearer 43847fc097864ee22bba7dcc4724c2ca8dd910870f8d856257e5954e5e39867a',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': 'XYZ',
          'email': 'xyz56545@gmail.com',
          'gender': 'male',
          'status': 'Active',
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      Utils.printLog('response success : ${response.statusCode}');
      Utils.printLog('response body : ${response.body}');
    } else {
      Utils.printLog('response failure : ${response.statusCode}');
      Utils.printLog('response failure : ${response.body}');
    }
  }
}
