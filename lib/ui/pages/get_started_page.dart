import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane_app/cubit/auth_cubit.dart';
import 'package:plane_app/cubit/google_gate_cubit.dart';
import 'package:plane_app/services/google_auth_service.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_button_widget.dart';

class GetStartedPage extends StatefulWidget {
  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  User? user;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg_plane.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly Like a Bird',
                  style: whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Explore new world with us and let \nyourself get an amazing experiences',
                  textAlign: TextAlign.center,
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                ),
                CustomButtonWidget(
                  textButton: 'Get Started',
                  width: 220,
                  onClickedFunction: () {
                    Navigator.pushNamed(context, '/sign-up');
                  },
                  margin: EdgeInsets.only(
                    top: 50,
                    bottom: 20,
                  ),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    bottom: 40,
                    right: 20,
                    left: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      user = await GoogleAuthService.signInWithGoogle(
                          context: context);
                      setState(() {
                        isLoading = false;
                      });
                      // context
                      //     .read<GoogleGateCubit>()
                      //     .signInGoogle(context: context);
                      // context.read<AuthCubit>().signIn(
                      //       email: user!.email!,
                      //       password:
                      //           'hdsifh8y0893i3hkdgbdfgho3u48u390ifodg',
                      //     );
                    },
                    child: Text(
                      isLoading ? 'Loading...' : 'Google Signin',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
