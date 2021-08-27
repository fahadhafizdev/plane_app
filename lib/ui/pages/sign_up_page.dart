import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';

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
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
              SizedBox(height: 6),
              TextFormField(
                cursorColor: blackColor,
                decoration: InputDecoration(
                  hintText: 'Your Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(defaultRadius),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(defaultRadius),
                    ),
                    borderSide: BorderSide(color: mainColor, width: 2.0),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget emailInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email Address',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
              SizedBox(height: 6),
              TextFormField(
                cursorColor: blackColor,
                decoration: InputDecoration(
                  hintText: 'Your Email Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(defaultRadius),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(defaultRadius),
                    ),
                    borderSide: BorderSide(color: mainColor, width: 2.0),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget passwordInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
              SizedBox(height: 6),
              TextFormField(
                obscureText: true,
                cursorColor: blackColor,
                decoration: InputDecoration(
                  hintText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(defaultRadius),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(defaultRadius),
                    ),
                    borderSide: BorderSide(color: mainColor, width: 2.0),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget hobbyInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hobby',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
              SizedBox(height: 6),
              TextFormField(
                cursorColor: blackColor,
                decoration: InputDecoration(
                  hintText: 'Your Hobby',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(defaultRadius),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(defaultRadius),
                    ),
                    borderSide: BorderSide(color: mainColor, width: 2.0),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget btnGetStarted() {
        return Container(
          margin: EdgeInsets.only(top: 10, bottom: 30),
          height: 55,
          width: double.infinity,
          child: ElevatedButton(
            style: btnStartedStyle,
            onPressed: () {},
            child: Text('Get Started'),
          ),
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
