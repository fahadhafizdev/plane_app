import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane_app/cubit/auth_cubit.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_button_widget.dart';
import 'package:plane_app/ui/widgets/custom_text_input.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController hobbyController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: 50,
        ),
        child: Text(
          'Join us and get \nyour next journey',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CustomTextInput(
          titleInput: 'Full Name',
          hintText: 'Your Name',
          controller: nameController,
        );
      }

      Widget emailInput() {
        return CustomTextInput(
          titleInput: 'Email Address',
          hintText: 'Your Email',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextInput(
          titleInput: 'Password',
          hintText: 'Your Password',
          obsucureText: true,
          controller: passwordController,
        );
      }

      Widget hobbyInput() {
        return CustomTextInput(
          titleInput: 'Hobby',
          hintText: 'Your Hobby',
          controller: hobbyController,
        );
      }

      Widget btnGetStarted() {
        return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/bonus-page', (route) => false);
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: redColor,
                content: Text(state.error),
              ),
            );
          }
        }, builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return CustomButtonWidget(
            textButton: 'Get Started',
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            onClickedFunction: () {
              context.read<AuthCubit>().signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text,
                    hobby: hobbyController.text,
                  );
            },
          );
        });
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              defaultRadius,
            ),
          ),
        ),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            hobbyInput(),
            btnGetStarted(),
          ],
        ),
      );
    }

    Widget tachButton() {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 73, top: 50),
        child: Text(
          'Terms and Conditions',
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(),
            tachButton(),
          ],
        ),
      ),
    );
  }
}
