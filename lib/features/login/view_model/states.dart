import 'package:ecommerce/features/login/model/login_response_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState({required this.error});
}

class LoginSucessState extends LoginStates {
  final LoginResponseModel user;

  LoginSucessState({required this.user});
}
