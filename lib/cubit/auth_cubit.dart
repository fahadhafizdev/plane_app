import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:plane_app/models/user_model.dart';
import 'package:plane_app/services/auth_service.dart';
import 'package:plane_app/services/google_auth_service.dart';
import 'package:plane_app/services/user_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({
    required String email,
    required String password,
    required String name,
    String hobby = '',
  }) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService()
          .signUp(email: email, password: password, name: name, hobby: hobby);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user =
          await AuthService().signIn(email: email, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut({required BuildContext context}) async {
    try {
      emit(AuthLoading());

      await AuthService().signOut();
      await GoogleAuthService.signOut(context: context);
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  Future<void> getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}

/*NOTE : TAHAPAN TAHAPAN 
1. AuthState -> membuat state state yang akan digunakan
2. AuthService -> untuk membuat service Authentikasi
    2.1 UserService -> membuat user service yang input nya berada di auth service
3. AuthCubit -> include function di Authservice ke dalam AuthCubit

*/
