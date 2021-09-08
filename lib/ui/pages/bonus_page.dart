import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane_app/cubit/auth_cubit.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/ui/widgets/custom_button_widget.dart';
import 'package:intl/intl.dart';

class BonusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget boxProfile() {
      return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        print(state.toString());
        if (state is AuthSuccess) {
          final formatCurrency = new NumberFormat("#,##0.00", "en_US");
          return Container(
            margin: EdgeInsets.only(top: 165, bottom: 80),
            padding: EdgeInsets.all(24),
            height: 211,
            width: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image_card.png'),
                ),
                boxShadow: [
                  BoxShadow(
                    color: mainColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: Offset(0, 10),
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NOTE: NAME
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: light,
                            ),
                          ),
                          Text(
                            '${state.user.name}',
                            style: whiteTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 20,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    //NOTE: PAY
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 6),
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                            ),
                          ),
                        ),
                        Text(
                          'Pay',
                          style: whiteTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 41),
                //NOTE: BALLANCE
                Text(
                  'Ballance',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                  ),
                ),
                Text(
                  'IDR ${formatCurrency.format(state.user.balance)}',
                  style: whiteTextStyle.copyWith(
                    fontSize: 26,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      });
    }

    Widget startFlyButton() {
      return CustomButtonWidget(
        textButton: 'Start Fly Now',
        width: 220,
        onClickedFunction: () {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        },
        margin: EdgeInsets.only(top: 50),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          children: [
            boxProfile(),
            Text(
              'Big Bonus 🎉',
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'We give you early credit so that \nyou can buy a flight ticket',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(
                fontWeight: light,
                fontSize: 16,
              ),
            ),
            startFlyButton(),
          ],
        ),
      ),
    );
  }
}
