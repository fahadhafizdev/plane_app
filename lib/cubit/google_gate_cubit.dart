import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:plane_app/services/google_auth_service.dart';

part 'google_gate_state.dart';

class GoogleGateCubit extends Cubit<GoogleGateState> {
  GoogleGateCubit() : super(GoogleGateInitial());

  Future<void> signInGoogle({required BuildContext context}) async {
    try {
      emit(GoogleGateLoading());
      await GoogleAuthService.signInWithGoogle(context: context);
      emit(GoogleGateSuccess());
    } catch (e) {
      emit(GoogleGateFailed('Google Gate Cubit : $e'));
    }
  }
}
