import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;
double defaultRadius = 17.0;

Color mainColor = Color(0xff5C40CC);
Color whiteColor = Color(0xffFFFFFF);
Color blackColor = Color(0xff1F1449);
Color greyColor = Color(0xff9698A9);
Color greenColor = Color(0xff0EC3AE);
Color redColor = Color(0xffEB70A5);
Color bgColor = Color(0xffFAFAFA);
Color transparentColor = Colors.transparent;
Color inActiveColor = Color(0xffDBD7EC);
Color unAvailableColor = Color(0xffEBECF1);
Color availableColor = Color(0xffE0D9FF);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: whiteColor,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  color: greyColor,
);

TextStyle greenTextStyle = GoogleFonts.poppins(
  color: greenColor,
);

TextStyle redTextStyle = GoogleFonts.poppins(
  color: redColor,
);

TextStyle purpleTextStyle = GoogleFonts.poppins(
  color: mainColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;

final ButtonStyle btnStartedStyle = ElevatedButton.styleFrom(
  primary: mainColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(defaultRadius),
    ),
  ),
);

final ButtonStyle btnGoogleStyle = ElevatedButton.styleFrom(
  primary: whiteColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(defaultRadius),
    ),
  ),
);

String exampleDesc =
    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.';
