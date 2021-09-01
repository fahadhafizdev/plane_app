import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';

class CustomStatusSeat extends StatelessWidget {
  final String name;
  final String imageUrl;
  final EdgeInsets margin;

  CustomStatusSeat({
    required this.name,
    required this.imageUrl,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 16,
          width: 16,
          margin: margin,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
            ),
          ),
        ),
        Text(name, style: blackTextStyle)
      ],
    );
  }
}
