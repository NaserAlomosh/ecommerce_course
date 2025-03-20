import 'package:ecommerce/core/extension/form_key_extension.dart';
import 'package:ecommerce/features/login/repo/login_repo.dart';
import 'package:ecommerce/features/login/view_model/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  final _loginRepo = LoginRepo();
  LoginCubit() : super(LoginInitialState());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.isValid()) {
      emit(LoginLoadingState());
      final result = await _loginRepo.loginRequest(
        email: emailController.text,
        password: passwordController.text,
      );
      result.fold(
        (error) => emit(LoginErrorState(error: error)),
        (user) => emit(LoginSucessState(user: user)),
      );
    }
  }
}
