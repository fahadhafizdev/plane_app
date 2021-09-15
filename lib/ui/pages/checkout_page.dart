import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:plane_app/cubit/auth_cubit.dart';
import 'package:plane_app/cubit/seat_cubit.dart';
import 'package:plane_app/cubit/transaction_cubit.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_booking_details.dart';
import 'package:plane_app/ui/widgets/custom_button_widget.dart';
import 'package:plane_app/ui/widgets/custom_card_checkout_widget.dart';

import 'package:plane_app/ui/pages/succes_checkout_page.dart';
import 'package:plane_app/models/transaction_model.dart';

class CheckOutPage extends StatelessWidget {
  final TransactionModel transaction;

  CheckOutPage(this.transaction);

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
            CustomCardCheckOutDestination(
              name: transaction.destination.name,
              imageUrl: transaction.destination.imageUrl,
              rating: transaction.destination.rating,
              city: transaction.destination.city,
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
              desc: '${transaction.amountOfTraveler} person',
              textStyle: blackTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            //NOTE:SEAT
            CustomBookingDetail(
              title: 'SEAT',
              desc: transaction.selectedSeats,
              textStyle: blackTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            //NOTE:INSURANCE
            CustomBookingDetail(
              title: 'Insurance',
              desc: (transaction.insurance) ? 'YES' : 'NO',
              textStyle: (transaction.insurance)
                  ? greenTextStyle.copyWith(
                      fontWeight: semiBold,
                    )
                  : redTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
            ),
            //NOTE:Refundable
            CustomBookingDetail(
              title: 'Refundable',
              desc: (transaction.refundable) ? 'YES' : 'NO',
              textStyle: (transaction.refundable)
                  ? greenTextStyle.copyWith(
                      fontWeight: semiBold,
                    )
                  : redTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
            ),
            //NOTE:VAT
            CustomBookingDetail(
              title: 'VAT',
              desc: '${(transaction.vat * 100).toStringAsFixed(0)} %',
              textStyle: blackTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            //NOTE:PRICE
            CustomBookingDetail(
              title: 'Price',
              desc: NumberFormat.currency(
                locale: 'id',
                decimalDigits: 0,
                symbol: 'IDR ',
              ).format(transaction.price),
              textStyle: blackTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            //NOTE:Grand Total
            CustomBookingDetail(
              title: 'Grand Total',
              desc: NumberFormat.currency(
                locale: 'id',
                decimalDigits: 0,
                symbol: 'IDR ',
              ).format(transaction.grandTotal),
              textStyle: purpleTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        if (state is AuthSuccess) {
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
                    //NOTE: button pay and plane
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            decimalDigits: 0,
                            symbol: 'IDR ',
                          ).format(state.user.balance),
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
        return SizedBox();
      });
    }

    Widget buttonPayNow() {
      return BlocConsumer<TransactionCubit, TransactionState>(
          listener: (context, state) {
        if (state is TransactionFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        } else if (state is TransactionSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SuccessCheckoutPage(),
            ),
          );
        }
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return Center(child: CircularProgressIndicator());
        }

        return CustomButtonWidget(
          textButton: 'Pay Now',
          width: double.infinity,
          onClickedFunction: () {
            context.read<TransactionCubit>().createTransaction(transaction);
          },
        );
      });
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
