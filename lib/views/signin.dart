import 'package:flutter/material.dart';
import '../widgets/adaptive_button.dart';
import '/constants/destination.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Center(
        child: AdaptiveButton(
          title: 'Home',
          callback: () {
            Navigator.of(context).pushNamed(Destination.home);
          },
        ),
      ),
    );
  }
}
