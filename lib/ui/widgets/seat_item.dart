import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane_app/cubit/seat_cubit.dart';

class SeatItem extends StatelessWidget {
  final String id;
  final bool isAvailable;

  SeatItem({
    required this.id,
    this.isAvailable = true,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return unAvailableColor;
      } else {
        if (!isSelected) {
          return availableColor;
        } else {
          return mainColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return unAvailableColor;
      } else {
        return mainColor;
      }
    }

    Widget child() {
      if (isSelected) {
        return Center(
          child: Text(
            'You',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
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
      ),
    );
  }
}
