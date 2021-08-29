import 'package:flutter/material.dart';

import 'package:plane_app/ui/pages/splash_page.dart';
import 'package:plane_app/ui/pages/get_started_page.dart';
import 'package:plane_app/ui/pages/sign_up_page.dart';
import 'package:plane_app/ui/pages/bonus_page.dart';
import 'package:plane_app/ui/pages/main_page.dart';

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
        '/sign-up': (context) => SignUpPage(),
        '/bonus-page': (context) => BonusPage(),
        '/main': (context) => MainPage(),
      },
    );
  }
}
