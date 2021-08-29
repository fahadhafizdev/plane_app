import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';

class CustomNavigationWidget extends StatelessWidget {
  final String imgUrl;
  final bool isActive;
  CustomNavigationWidget({required this.imgUrl, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 24,
          width: 24,
          margin: EdgeInsets.only(top: 18),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgUrl),
            ),
          ),
        ),
        Container(
          height: 2,
          width: 30,
          decoration: BoxDecoration(
            color: isActive == true ? mainColor : transparentColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        )
      ],
    );
  }
}
