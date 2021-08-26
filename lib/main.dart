import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plane App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Image.asset(
            'assets/images/logo.png',
            color: Colors.red,
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
