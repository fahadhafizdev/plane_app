import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane_app/cubit/page_cubit.dart';

class CustomNavigationWidget extends StatelessWidget {
  final String imgUrl;

  final index;
  CustomNavigationWidget({
    required this.imgUrl,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 18),
            child: Image.asset(
              imgUrl,
              height: 24,
              width: 24,
              color: context.read<PageCubit>().state == index
                  ? mainColor
                  : greyColor,
            ),
          ),
          Container(
            height: 2,
            width: 30,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? mainColor
                  : transparentColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          )
        ],
      ),
    );
  }
}
