import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;

    String username = state.username;
    String password = state.password;

    print("username => $username");
    print("password => $password");

    try {} catch (e) {}
  }
}
