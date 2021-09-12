import 'package:flutter/material.dart';
import 'package:plane_app/models/destination_model.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/pages/detail_page.dart';

class CustomCardNewDestination extends StatelessWidget {
  final DestinationModel destinations;

  CustomCardNewDestination(this.destinations);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(destinations),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 16,
        ),
        height: 90,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(destinations.imageUrl),
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
                  destinations.name,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  destinations.city,
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
              '${destinations.rating}',
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
