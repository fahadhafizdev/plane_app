import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_booking_details.dart';
import 'package:plane_app/ui/widgets/custom_button_widget.dart';
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
        width: double.infinity,
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
              marginRow: EdgeInsets.only(right: 10),
              rating: 4.8,
              isActivedTap: false,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'Booking Details',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
            ),
            //NOTE:TRAVELER
            CustomBookingDetail(
              title: 'Traveler',
              desc: '2 person',
              textStyle: blackTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            //NOTE:SEAT
            CustomBookingDetail(
              title: 'SEAT',
              desc: 'A3\, B3',
              textStyle: blackTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            //NOTE:INSURANCE
            CustomBookingDetail(
              title: 'Insurance',
              desc: 'YES',
              textStyle: greenTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            //NOTE:Refundable
            CustomBookingDetail(
              title: 'Refundable',
              desc: 'NO',
              textStyle: redTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            //NOTE:VAT
            CustomBookingDetail(
              title: 'VAT',
              desc: '45%',
              textStyle: blackTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            //NOTE:PRICE
            CustomBookingDetail(
              title: 'Price',
              desc: 'IDR 8.500.690',
              textStyle: blackTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            //NOTE:Grand Total
            CustomBookingDetail(
              title: 'Grand Total',
              desc: 'IDR 12.000.000',
              textStyle: purpleTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        width: double.infinity,
        height: 170,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Details',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 23,
                  ),
                  height: 70,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/btn_bg.png'),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: mainColor.withOpacity(0.2),
                        blurRadius: 30,
                        offset: Offset(0, 30),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 6),
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                      ),
                      Text(
                        'Pay',
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'IDR 80.400.000',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Current Balance',
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget buttonPayNow() {
      return CustomButtonWidget(
        textButton: 'Pay Now',
        width: double.infinity,
        onClickedFunction: () {},
      );
    }

    Widget linkTermCondition() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Text(
          'Terms and Conditions',
          textAlign: TextAlign.center,
          style: greyTextStyle.copyWith(
            fontWeight: light,
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
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
            paymentDetails(),
            buttonPayNow(),
            linkTermCondition(),
          ],
        ),
      ),
    );
  }
}
