import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_button_widget.dart';
import 'package:plane_app/ui/widgets/custom_text_input.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
        ),
        child: Text(
          'Login Plane',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget imageSection() {
      return Container(
        height: 70,
        margin: EdgeInsets.only(
          top: defaultMargin,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image_checkout.png'),
          ),
        ),
      );
    }

    Widget inputSection() {
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

      Widget btnGetStarted() {
        return CustomButtonWidget(
          textButton: 'Login',
          width: double.infinity,
          margin: EdgeInsets.only(top: 10),
          onClickedFunction: () {},
        );
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
            emailInput(),
            passwordInput(),
            btnGetStarted(),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            imageSection(),
            inputSection(),
          ],
        ),
      ),
    );
  }
}
