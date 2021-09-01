import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_booking_details.dart';
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
              marginRow: EdgeInsets.all(0),
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
              children: [],
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
            paymentDetails(),
          ],
        ),
      ),
    );
  }
}
