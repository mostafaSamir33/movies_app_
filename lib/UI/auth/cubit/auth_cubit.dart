import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/UI/auth/Service/AuthService%20.dart';
import 'package:movies_app/UI/auth/Service/googleServices.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;

  AuthCubit(this.authService) : super(AuthInitial());

  void login(String email, String password, BuildContext context) async {
    emit(AuthLoading());
    try {
      await authService.login(email, password, context);
      emit(AuthSuccess('Login Successful'));
    } catch (e) {
      emit(AuthFailure(e.toString().replaceAll('Exception:', '').trim()));
    }
  }

  void register(
    String name,
    String email,
    String password,
    String confirmPassword,
    String phone,
    int avatarId,
    BuildContext context,
  ) async {
    emit(AuthLoading());

    try {
      final res = await authService.register(
        context,
        name,
        email,
        password,
        confirmPassword,
        phone,
        avatarId,
      );

      if (res['message'] != null &&
          res['message'].toLowerCase().contains('success')) {
        emit(AuthSuccess('Registration Successful'));
      } else {
        emit(AuthFailure(res['message'] ?? 'Registration failed'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString().replaceAll('Exception:', '').trim()));
    }
  }

  void loginWithGoogle(BuildContext context) async {
    emit(AuthLoading());
    try {
      final user = await Googleservices.login();

      if (user == null) {
        emit(AuthFailure("Google Sign-In Cancelled"));
      } else {
        String username = user.displayName ?? user.email.split("@").first;

        emit(AuthSuccess("Welcome $username"));
      }
    } catch (e) {
      emit(AuthFailure(e.toString().replaceAll('Exception:', '').trim()));
    }
  }
}
