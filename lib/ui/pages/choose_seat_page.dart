import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane_app/cubit/seat_cubit.dart';
import 'package:plane_app/models/destination_model.dart';
import 'package:plane_app/models/transaction_model.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_button_widget.dart';
import 'package:plane_app/ui/widgets/custom_status_seat_widget.dart';
import 'package:plane_app/ui/widgets/seat_item.dart';
import 'package:plane_app/ui/pages/checkout_page.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget {
  DestinationModel destinations;

  ChooseSeatPage(this.destinations);

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
      return BlocBuilder<SeatCubit, List<String>>(builder: (context, state) {
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
                      id: 'A1',
                      isAvailable: false,
                    ),
                    SeatItem(
                      id: 'B1',
                      isAvailable: false,
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
                      id: 'C1',
                    ),
                    SeatItem(
                      id: 'D1',
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
                      id: 'A2',
                    ),
                    SeatItem(
                      id: 'B2',
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
                      id: 'C2',
                    ),
                    SeatItem(
                      id: 'D2',
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
                      id: 'A3',
                    ),
                    SeatItem(
                      id: 'B3',
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
                      id: 'C3',
                    ),
                    SeatItem(
                      id: 'D3',
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
                      id: 'A4',
                    ),
                    SeatItem(
                      id: 'B4',
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
                      id: 'C4',
                    ),
                    SeatItem(
                      id: 'D4',
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
                      id: 'A5',
                    ),
                    SeatItem(
                      id: 'B5',
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
                      id: 'C5',
                    ),
                    SeatItem(
                      id: 'D5',
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
                    state.join(" ,"),
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
                    NumberFormat.currency(
                      locale: 'id',
                      decimalDigits: 0,
                      symbol: 'IDR ',
                    ).format(state.length * destinations.price),
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
      });
    }

    Widget buttonCheckout() {
      return BlocBuilder<SeatCubit, List<String>>(builder: (context, state) {
        return CustomButtonWidget(
          textButton: 'Continue to Checkout',
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 46),
          onClickedFunction: () {
            int price = destinations.price * state.length;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckOutPage(
                  TransactionModel(
                    destination: destinations,
                    amountOfTraveler: state.length,
                    selectedSeats: state.join(', '),
                    insurance: true,
                    refundable: false,
                    price: price,
                    vat: 0.45,
                    grandTotal: price + (price * 0.45).toInt(),
                  ),
                ),
              ),
            );
          },
        );
      });
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
