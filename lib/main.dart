import 'package:flutter/material.dart';
import 'package:plane_app/ui/pages/splash_page.dart';
import 'package:plane_app/ui/pages/get_started_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plane App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/get-started': (context) => GetStartedPage(),
      },
    );
  }
}
