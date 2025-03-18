abstract class SignupStates {}

class SignupInitial extends SignupStates {}

class SignupLoadingState extends SignupStates {}

class SignupErrorState extends SignupStates {
  final String error;

  SignupErrorState({required this.error});
}

class SignupSucessState extends SignupStates {}
