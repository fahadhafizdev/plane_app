import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_card_destination_widget.dart';
import 'package:plane_app/ui/widgets/custom_card_new_destination_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 30,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Howdy, \nHafiz',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Where to fly today ?',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/image_profile.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget popularDestination() {
      return Container(
        height: 323,
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CustomCardDestination(
              name: 'Lake Ciliwung',
              city: 'Tanggerang',
              rating: 4.8,
              imageUrl: 'assets/images/destination1.png',
            ),
            CustomCardDestination(
              name: 'White Houses',
              city: 'Spain',
              rating: 4.7,
              imageUrl: 'assets/images/destination2.png',
            ),
            CustomCardDestination(
              name: 'Hill Heyo',
              city: 'Monaco',
              rating: 4.8,
              imageUrl: 'assets/images/destination3.png',
            ),
          ],
        ),
      );
    }

    Widget title() {
      return Padding(
        padding: EdgeInsets.only(left: defaultMargin),
        child: Text(
          'New This Year',
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
      );
    }

    Widget newDestination() {
      return Column(
        children: [
          CustomCardNewDestination(
            name: 'Danau Beratan',
            city: 'Singajara',
            imageUrl: 'assets/images/destination1.png',
            rating: 4.9,
          ),
          CustomCardNewDestination(
            name: 'Sydney Opera',
            city: 'Australia',
            imageUrl: 'assets/images/destination2.png',
            rating: 4.9,
          ),
          CustomCardNewDestination(
            name: 'Roma',
            city: 'italy',
            imageUrl: 'assets/images/destination3.png',
            rating: 4.9,
          ),
        ],
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          popularDestination(),
          title(),
          newDestination(),
          SizedBox(height: 140),
        ],
      ),
    );
  }
}
