import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_card_new_destination_widget.dart';
import 'package:plane_app/ui/widgets/custom_interst.dart';

class CheckOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget imageCheckout() {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 50),
        height: 65,
        width: 291,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image_checkout.png'),
          ),
        ),
      );
    }

    Widget cityToFly() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CGK',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 24),
                ),
                Text(
                  'Tanggerang',
                  style: greyTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'TLC',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 24),
                ),
                Text(
                  'Ciliwung',
                  style: greyTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget cardBooking() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        height: 427,
        width: 327,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCardNewDestination(
              name: 'Lake Ciliwung',
              city: 'Tangerang',
              imageUrl: 'assets/images/destination1.png',
              margin: EdgeInsets.only(bottom: 20),
              marginRow: EdgeInsets.all(0),
              rating: 4.8,
              isActivedTap: false,
            ),
            Text(
              'Booking Details',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            //NOTE:TRAVELER
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  CustomInterest(text: 'Traveler'),
                  Text(
                    '2 person',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
            //NOTE:SEAT
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  CustomInterest(text: 'SEAT'),
                  Text(
                    'A3\, B3',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
            //NOTE:INSURANCE
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  CustomInterest(text: 'Insurance'),
                  Text(
                    'YES',
                    style: greenTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
            //NOTE:Refundable
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  CustomInterest(text: 'Refundable'),
                  Text(
                    'NO',
                    style: redTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
            //NOTE:VAT
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  CustomInterest(text: 'VAT'),
                  Text(
                    '45%',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
            //NOTE:PRICE
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  CustomInterest(text: 'Price'),
                  Text(
                    'IDR 8.500.690',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
            //NOTE:Grand Total
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  CustomInterest(text: 'Grand Total'),
                  Text(
                    'IDR 12.000.000',
                    style: purpleTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            imageCheckout(),
            cityToFly(),
            cardBooking(),
          ],
        ),
      ),
    );
  }
}
