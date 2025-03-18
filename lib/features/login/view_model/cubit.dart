import 'dart:developer';

import 'package:ecommerce/core/extension/form_key_extension.dart';
import 'package:ecommerce/features/login/view_model/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.isValid()) {
      try {
        emit(LoginLoadingState());
        final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        emit(LoginSucessState());
      } on FirebaseAuthException catch (e) {
        log(e.message ?? '');
        emit(LoginErrorState(error: e.message ?? ''));
      }
    }
  }
}
