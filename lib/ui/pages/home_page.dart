import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane_app/cubit/auth_cubit.dart';
import 'package:plane_app/cubit/destination_cubit.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/models/destination_model.dart';
import 'package:plane_app/ui/widgets/custom_card_destination_widget.dart';
import 'package:plane_app/ui/widgets/custom_card_new_destination_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  Future<void> _refresh() {
    return Future.delayed(Duration(seconds: 2), () {
      print('refresh');
      context.read<DestinationCubit>().fetchDestinations();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        print('state :' + state.toString());
        if (state is AuthSuccess) {
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
                        'Howdy, \n${state.user.name}',
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
        } else {
          return SizedBox();
        }
      });
    }

    Widget popularDestination(List<DestinationModel> destinations) {
      return Container(
        height: 323,
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: destinations.map((data) {
            return CustomCardDestination(data);
          }).toList(),
        ),
      );
    }

    Widget title() {
      return Padding(
        padding: EdgeInsets.only(left: defaultMargin, bottom: 16),
        child: Text(
          'New This Year',
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
      );
    }

    Widget newDestination(List<DestinationModel> destinations) {
      return Column(
        children: destinations.map((data) {
          return CustomCardNewDestination(data);
        }).toList(),
      );
    }

    return Scaffold(
      body: BlocConsumer<DestinationCubit, DestinationState>(
          listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: redColor,
              content: Text(state.error),
            ),
          );
        }
      }, builder: (context, state) {
        if (state is DestinationSuccess) {
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              children: [
                header(),
                popularDestination(state.destinations),
                title(),
                newDestination(state.destinations),
                SizedBox(height: 140),
              ],
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
