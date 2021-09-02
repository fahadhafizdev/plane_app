import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';

import 'package:plane_app/ui/pages/main_page.dart';
import 'package:plane_app/ui/widgets/custom_button_widget.dart';

class SuccessCheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: 150,
              width: 300,
              margin: EdgeInsets.only(
                top: 250,
                bottom: 80,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image_success.png'),
                ),
              ),
            ),
            Text(
              'Well Booked 😍',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Are you ready to explore the new \nworld of experiences?',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(
                fontWeight: light,
                fontSize: 16,
              ),
            ),
            CustomButtonWidget(
                textButton: 'My Bookings',
                margin: EdgeInsets.only(top: 50, bottom: 140),
                width: MediaQuery.of(context).size.width - (77 + 77),
                onClickedFunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
