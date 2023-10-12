import 'package:flutter/material.dart';
import 'package:test/home.dart';
import 'package:test/states.dart';

class ControllerAuthState extends ValueNotifier<AuthState> {
  ControllerAuthState() : super(LogoutAuthState());

  Future<void> login() async {
    value = LoadingAuthState();
    await Future.delayed(const Duration(seconds: 3));
    value = LoggedAuthState('Sandro');
  }

  Future<void> logout() async {
    //Navigator.pop(context);
    value = LoadingAuthState();
    await Future.delayed(const Duration(seconds: 2));
    value = LogoutAuthState();
  }
}
