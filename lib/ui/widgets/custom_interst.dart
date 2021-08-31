import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';

class CustomInterest extends StatelessWidget {
  final String text;
  CustomInterest({required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 6),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/icon_checklist.png'),
              ),
            ),
          ),
          Text(
            text,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
