import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:plane_app/cubit/transaction_cubit.dart';
import 'package:plane_app/models/transaction_model.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_booking_details.dart';
import 'package:plane_app/ui/widgets/custom_card_checkout_widget.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TransactionCubit>().fetchTransaction();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget cardBooking(TransactionModel transaction) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
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

    return Scaffold(
      backgroundColor: bgColor,
      body: BlocConsumer<TransactionCubit, TransactionState>(
          listener: (context, state) {
        if (state is TransactionFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: redColor,
              content: Text(state.error),
            ),
          );
        }
      }, builder: (context, state) {
        if (state is TransactionSuccess) {
          print(state.transactions.toString());

          if (state.transactions.length == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 299.96,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/image_success.png',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Maaf belum ada transaksi',
                    style: greyTextStyle,
                  ),
                ],
              ),
            );
          }
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: defaultMargin,
                ),
                child: Text(
                  'History\nTransaction',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 24,
                  ),
                ),
              ),
              Column(
                children: state.transactions
                    .map(
                      (transaction) => cardBooking(transaction),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 150,
              ),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
