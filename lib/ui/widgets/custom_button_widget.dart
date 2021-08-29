import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';

class CustomButtonWidget extends StatelessWidget {
  final String textButton;
  final double width;
  final Function() onClickedFunction;
  final EdgeInsets margin;

  CustomButtonWidget({
    required this.textButton,
    required this.width,
    required this.onClickedFunction,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: width,
      margin: margin,
      child: ElevatedButton(
        style: btnStartedStyle,
        onPressed: onClickedFunction,
        child: Text(
          textButton,
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
