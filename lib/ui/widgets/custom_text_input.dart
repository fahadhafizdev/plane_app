import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';

class CustomTextInput extends StatelessWidget {
  final String titleInput;
  final String hintText;
  final bool obsucureText;
  final TextEditingController controller;

  CustomTextInput({
    required this.titleInput,
    required this.hintText,
    this.obsucureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleInput,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
          ),
          SizedBox(height: 6),
          TextFormField(
            controller: controller,
            obscureText: obsucureText,
            cursorColor: blackColor,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(defaultRadius),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(defaultRadius),
                ),
                borderSide: BorderSide(color: mainColor, width: 2.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
