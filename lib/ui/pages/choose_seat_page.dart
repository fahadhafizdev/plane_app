import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_button_widget.dart';
import 'package:plane_app/ui/widgets/custom_status_seat_widget.dart';
import 'package:plane_app/ui/widgets/seat_item.dart';

class ChooseSeatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 24,
          ),
        ),
      );
    }

    Widget statusSeat() {
      return Row(
        children: [
          CustomStatusSeat(
            name: 'Available',
            imageUrl: 'assets/images/icon_available.png',
            margin: EdgeInsets.only(right: 6),
          ),
          CustomStatusSeat(
            name: 'Selected',
            imageUrl: 'assets/images/icon_selected.png',
            margin: EdgeInsets.only(right: 6, left: 10),
          ),
          CustomStatusSeat(
            name: 'Unavailable',
            imageUrl: 'assets/images/icon_unavailable.png',
            margin: EdgeInsets.only(right: 6, left: 10),
          ),
        ],
      );
    }

    Widget cardSeat() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 22),
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            //NOTE: SEAT INDICATORS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 48,
                  child: Center(
                    child: Text(
                      'A',
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 48,
                  child: Center(
                    child: Text(
                      'B',
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 48,
                  child: Center(
                    child: Text(
                      ' ',
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 48,
                  child: Center(
                    child: Text(
                      'C',
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 48,
                  child: Center(
                    child: Text(
                      'D',
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            //NOTE: SEAT 1
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(
                    status: 2,
                  ),
                  SeatItem(
                    status: 2,
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    child: Center(
                      child: Text(
                        '1',
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  SeatItem(
                    status: 0,
                  ),
                  SeatItem(
                    status: 2,
                  ),
                ],
              ),
            ),
            //NOTE: SEAT 2
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(
                    status: 0,
                  ),
                  SeatItem(
                    status: 0,
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    child: Center(
                      child: Text(
                        '2',
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  SeatItem(
                    status: 0,
                  ),
                  SeatItem(
                    status: 3,
                  ),
                ],
              ),
            ),

            //NOTE: SEAT 3
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(
                    status: 2,
                  ),
                  SeatItem(
                    status: 2,
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    child: Center(
                      child: Text(
                        '3',
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  SeatItem(
                    status: 1,
                  ),
                  SeatItem(
                    status: 1,
                  ),
                ],
              ),
            ),
            //NOTE: SEAT 4
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(
                    status: 0,
                  ),
                  SeatItem(
                    status: 2,
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    child: Center(
                      child: Text(
                        '4',
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  SeatItem(
                    status: 0,
                  ),
                  SeatItem(
                    status: 0,
                  ),
                ],
              ),
            ),
            //NOTE: SEAT 5
            Container(
              margin: EdgeInsets.only(
                top: 16,
                bottom: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(
                    status: 0,
                  ),
                  SeatItem(
                    status: 0,
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    child: Center(
                      child: Text(
                        '5',
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  SeatItem(
                    status: 2,
                  ),
                  SeatItem(
                    status: 0,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Your seat',
                    style: greyTextStyle.copyWith(fontWeight: light),
                  ),
                ),
                Text(
                  'A3, B3',
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            SizedBox(height: 17),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Total',
                    style: greyTextStyle.copyWith(fontWeight: light),
                  ),
                ),
                Text(
                  'IDR 540.000.000',
                  style: purpleTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget buttonCheckout() {
      return CustomButtonWidget(
        textButton: 'Continue to Checkout',
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 46),
        onClickedFunction: () {},
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            statusSeat(),
            cardSeat(),
            buttonCheckout(),
          ],
        ),
      ),
    );
  }
}
