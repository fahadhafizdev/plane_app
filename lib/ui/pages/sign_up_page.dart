import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_button_widget.dart';
import 'package:plane_app/ui/widgets/custom_text_input.dart';

class SignUpPage extends StatelessWidget {
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
        );
      }

      Widget emailInput() {
        return CustomTextInput(
          titleInput: 'Email Address',
          hintText: 'Your Email',
        );
      }

      Widget passwordInput() {
        return CustomTextInput(
          titleInput: 'Password',
          hintText: 'Your Password',
          obsucureText: true,
        );
      }

      Widget hobbyInput() {
        return CustomTextInput(
          titleInput: 'Hobby',
          hintText: 'Your Hobby',
        );
      }

      Widget btnGetStarted() {
        return CustomButtonWidget(
          textButton: 'Get Started',
          width: double.infinity,
          margin: EdgeInsets.only(top: 10),
          onClickedFunction: () {
            Navigator.pushNamed(context, '/bonus-page');
          },
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
