import 'package:ecommerce/features/login/view_model/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(LoginLoadingState());
      await loginRequest(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(LoginSucessState());
    }
  }
}

//

//
///
///
///
///
///
///
///
///
///
Future<void> loginRequest({required String email, required String password}) async {
  await Future.delayed(const Duration(seconds: 10));
}
///