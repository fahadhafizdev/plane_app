import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/pages/detail_page.dart';

class CustomCardNewDestination extends StatelessWidget {
  final String name;
  final String city;
  final String imageUrl;
  final double rating;
  final EdgeInsets margin;
  final EdgeInsets marginRow;
  final bool isActivedTap;

  CustomCardNewDestination({
    required this.name,
    required this.city,
    required this.imageUrl,
    required this.rating,
    this.margin = const EdgeInsets.only(
      left: 24,
      right: 24,
      top: 16,
    ),
    this.marginRow = const EdgeInsets.all(10),
    this.isActivedTap = true,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isActivedTap
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(),
                ),
              )
            : print('');
      },
      child: Container(
        height: 90,
        margin: margin,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              margin: marginRow,
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            ),
            SizedBox(width: 6),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  city,
                  style: greyTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 14,
                  ),
                )
              ],
            ),
            Spacer(),
            Container(
              height: 24,
              width: 24,
              margin: EdgeInsets.only(right: 2),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/icon_star.png'),
                ),
              ),
            ),
            Text(
              '$rating',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 14,
              ),
            ),
            SizedBox(width: 16)
          ],
        ),
      ),
    );
  }
}
