import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_navigation_widget.dart';
import 'package:plane_app/ui/pages/home_page.dart';
import 'package:plane_app/cubit/page_cubit.dart';
import 'package:plane_app/ui/pages/transaction_page.dart';
import 'package:plane_app/ui/pages/setting_page.dart';
import 'package:plane_app/ui/pages/wallet_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
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
                index: 0,
              ),
              CustomNavigationWidget(
                imgUrl: 'assets/images/icon_book.png',
                index: 1,
              ),
              CustomNavigationWidget(
                imgUrl: 'assets/images/icon_wallet.png',
                index: 2,
              ),
              CustomNavigationWidget(
                imgUrl: 'assets/images/icon_gear.png',
                index: 3,
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: Stack(
            children: [
              buildContent(currentIndex),
              customButtonNavigation(),
            ],
          ),
        );
      },
    );
  }
}
