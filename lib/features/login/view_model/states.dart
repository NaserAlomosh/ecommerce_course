import 'package:ecommerce/core/local/local_storage_service.dart';
import 'package:ecommerce/features/login/model/login_response_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState({required this.error});
}

class LoginSucessState extends LoginStates {}
