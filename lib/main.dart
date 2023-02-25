import 'package:flutter/material.dart';

import './views/signin.dart';
import './views/signup.dart';
import './views/home.dart';
import './constants/destination.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => const SignInScreen(),
        Destination.signin: (ctx) => const SignInScreen(),
        Destination.signup: (ctx) => const SignupScreen(),
        Destination.home: (ctx) => const HomeScreen(),
      },
    );
  }
}
