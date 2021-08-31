import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_button_widget.dart';
import 'package:plane_app/ui/widgets/custom_interst.dart';
import 'package:plane_app/ui/widgets/photos_item.dart';

class DetailPage extends StatelessWidget {
  Widget backgroundImage() {
    return Container(
      height: 450,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/destination1.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget customShadow() {
    return Container(
      margin: EdgeInsets.only(top: 236),
      height: 214,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            whiteColor.withOpacity(0),
            Colors.black.withOpacity(0.95),
          ],
        ),
      ),
    );
  }

  Widget contentBody() {
    Widget iconEmblem() {
      return Container(
        margin: EdgeInsets.only(bottom: 246),
        height: 24,
        width: 108,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/icon_emblem.png'),
          ),
        ),
      );
    }

    Widget headerTitle() {
      return Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lake Ciliwung',
                style: whiteTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'Tangerang',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(right: 2),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/icon_star.png'),
              ),
            ),
          ),
          Text(
            '4.8',
            style: whiteTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 14,
            ),
          ),
        ],
      );
    }

    Widget cardContent() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 30,
        ),
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 6),
            Text(
              exampleDesc,
              style: blackTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Photos',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 6),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PhotosItem(imageUrl: 'assets/images/photos1.png'),
                  PhotosItem(imageUrl: 'assets/images/photos2.png'),
                  PhotosItem(imageUrl: 'assets/images/photos3.png'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Interests',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CustomInterest(text: 'Kids Park'),
                CustomInterest(text: 'Honor Bridge'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CustomInterest(text: 'City Museum'),
                CustomInterest(text: 'Central Mall'),
              ],
            ),
          ],
        ),
      );
    }

    Widget buttonBook() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'IDR 2.500.000',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'per orang',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            CustomButtonWidget(
                textButton: 'Book Now', width: 170, onClickedFunction: () {})
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(
        top: 40,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Column(
        children: [
          iconEmblem(),
          headerTitle(),
          cardContent(),
          buttonBook(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            contentBody(),
          ],
        ),
      ),
    );
  }
}
