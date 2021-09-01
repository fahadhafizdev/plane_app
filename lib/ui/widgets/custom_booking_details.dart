import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';

import 'package:plane_app/ui/widgets/custom_interst.dart';

class CustomBookingDetail extends StatelessWidget {
  final String title;
  final String desc;
  final TextStyle textStyle;

  CustomBookingDetail({
    required this.title,
    required this.desc,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          CustomInterest(text: title),
          Text(
            desc,
            style: textStyle,
          )
        ],
      ),
    );
  }
}
