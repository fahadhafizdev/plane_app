import 'package:flutter/material.dart';
import 'package:plane_app/models/destination_model.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/pages/detail_page.dart';

class CustomCardDestination extends StatelessWidget {
  final DestinationModel destinations;

  CustomCardDestination(this.destinations);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage()),
        );
      },
      child: Container(
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
                  image: NetworkImage(destinations.imageUrl),
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
                        '${destinations.rating}',
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
                destinations.name,
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
                destinations.city,
                style: greyTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
