import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plane_app/cubit/auth_cubit.dart';
import 'package:plane_app/services/user_service.dart';
// import 'package:jobseeker_employer/models/registration_model.dart';
// import 'package:jobseeker_employer/theme.dart';
// import 'package:path_provider/path_provider.dart';

class GoogleAuthService {
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    // TODO: Add auto login logic

    return firebaseApp;
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;

        print(user!.email);
        print(user.photoURL);
        print(user.displayName);
        print(user.phoneNumber);

        await UserService().checkUserById(
          user.uid,
          user.displayName!,
          user.email!,
        );
        await context.read<AuthCubit>().getCurrentUser(user.uid);

        // final http.Response responseData =
        //     await http.get(Uri.parse(user.photoURL.toString()));
        // Uint8List uint8list = responseData.bodyBytes;
        // var buffer = uint8list.buffer;
        // ByteData byteData = ByteData.view(buffer);
        // var tempDir = await getTemporaryDirectory();
        // File file = await File('${tempDir.path}/img').writeAsBytes(
        //     buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

        // return RegistrationModel(
        //     businessName: user.displayName.toString(),
        //     email: user.email.toString(),
        //     phoneNumber: user.phoneNumber.toString(),
        //     photoUrl: file);
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        return user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            GoogleAuthService.customSnackBar(
              context: context,
              content:
                  'The account already exists with a different credential.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            GoogleAuthService.customSnackBar(
              context: context,
              content: 'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          GoogleAuthService.customSnackBar(
            context: context,
            content: 'Error occurred using Google Sign-In. Try again.',
          ),
        );
      }
    }
  }

  static SnackBar customSnackBar(
      {required String content, required BuildContext context}) {
    return SnackBar(
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.pink,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        right: 20,
        left: 20,
      ),
    );
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          content: 'Error signing out. Try again.',
          context: context,
        ),
      );
    }
  }
}
