import 'package:ecommerce/core/extension/form_key_extension.dart';
import 'package:ecommerce/features/signup/repo/signup_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_states.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(SignupInitial());
  final _signupRepo = SignupRepo();
  final formKey = GlobalKey<FormState>();
  //
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  void createAccount() async {
    if (formKey.isValid()) {
      emit(SignupLoadingState());
      final result = await _signupRepo.createAccountRequest(
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text,
        phone: phoneController.text,
      );
      result.fold(
        (error) => emit(SignupErrorState(error: error)),
        (user) => emit(SignupSucessState(credential: user)),
      );
    }
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
