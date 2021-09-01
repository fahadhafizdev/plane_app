import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';

class SeatItem extends StatelessWidget {
  final int status;

  SeatItem({required this.status});

  @override
  Widget build(BuildContext context) {
    backgroundColor() {
      switch (status) {
        case 0:
          return availableColor;
        case 1:
          return mainColor;
        case 2:
          return unAvailableColor;

        default:
          return unAvailableColor;
      }
    }

    borderColor() {
      switch (status) {
        case 0:
          return mainColor;
        case 1:
          return mainColor;
        case 2:
          return unAvailableColor;

        default:
          return unAvailableColor;
      }
    }

    Widget child() {
      switch (status) {
        case 0:
          return SizedBox();
        case 1:
          return Center(
            child: Text(
              'You',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          );
        case 2:
          return SizedBox();

        default:
          return SizedBox();
      }
    }

    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: backgroundColor(),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor(),
          width: 2.0,
        ),
      ),
      child: child(),
    );
  }
}
