import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_navigation_widget.dart';
import 'package:plane_app/ui/pages/home_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      return HomePage();
    }

    Widget customButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 60,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 29),
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: 30,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomNavigationWidget(
                imgUrl: 'assets/images/icon_home.png',
                isActive: true,
              ),
              CustomNavigationWidget(
                imgUrl: 'assets/images/icon_book.png',
                isActive: false,
              ),
              CustomNavigationWidget(
                imgUrl: 'assets/images/icon_wallet.png',
                isActive: false,
              ),
              CustomNavigationWidget(
                imgUrl: 'assets/images/icon_gear.png',
                isActive: false,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          buildContent(),
          customButtonNavigation(),
        ],
      ),
    );
  }
}
