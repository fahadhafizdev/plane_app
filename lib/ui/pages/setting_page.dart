import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';
import 'package:plane_app/cubit/auth_cubit.dart';
import 'package:plane_app/ui/widgets/custom_button_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: redColor,
              content: Text(state.error),
            ),
          );
        } else if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/get-started', (route) => false);
        }
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: CustomButtonWidget(
              textButton: 'Sign Out',
              width: 200,
              onClickedFunction: () {
                context.read<AuthCubit>().signOut();
              }),
        );
      }),
    );
  }
}
