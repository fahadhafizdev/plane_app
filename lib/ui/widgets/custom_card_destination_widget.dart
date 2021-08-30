import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';

class CustomCardDestination extends StatelessWidget {
  final String name;
  final String city;
  final String imageUrl;
  final double rating;

  CustomCardDestination({
    required this.name,
    required this.city,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 323,
      width: 200,
      margin: EdgeInsets.only(
        left: defaultMargin,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            width: 180,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.only(left: 5.5, right: 3, bottom: 6),
                height: 30,
                width: 54.5,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 2),
                      height: 24,
                      width: 24,
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
                  ],
                ),
              ),
            ),
          ),

          //NOTE: TITLE DESTINATION
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              name,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              city,
              style: greyTextStyle.copyWith(
                fontWeight: light,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
