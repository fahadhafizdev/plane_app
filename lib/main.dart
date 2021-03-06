import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane_app/cubit/destination_cubit.dart';
import 'package:plane_app/cubit/google_gate_cubit.dart';
import 'package:plane_app/cubit/seat_cubit.dart';
import 'package:plane_app/cubit/transaction_cubit.dart';
import 'package:plane_app/ui/pages/sign_in_page.dart';

import 'package:plane_app/ui/pages/splash_page.dart';
import 'package:plane_app/ui/pages/get_started_page.dart';
import 'package:plane_app/ui/pages/sign_up_page.dart';
import 'package:plane_app/ui/pages/bonus_page.dart';
import 'package:plane_app/ui/pages/main_page.dart';
import 'package:plane_app/cubit/page_cubit.dart';
import 'package:plane_app/cubit/auth_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plane_app/ui/pages/succes_checkout_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
        BlocProvider(
          create: (context) => GoogleGateCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Plane App',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus-page': (context) => BonusPage(),
          '/main': (context) => MainPage(),
          '/success-page': (context) => SuccessCheckoutPage(),
        },
      ),
    );
  }
}
