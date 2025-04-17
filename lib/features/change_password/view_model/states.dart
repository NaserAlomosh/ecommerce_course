abstract class ChangePasswordStates {}

class ChangePasswordInitial extends ChangePasswordStates {}

class ChangePasswordLoading extends ChangePasswordStates {}

class ChangePasswordError extends ChangePasswordStates {
  final String error;
  ChangePasswordError({required this.error});
}

class ChangePasswordSucess extends ChangePasswordStates {
  final String message;
  ChangePasswordSucess({required this.message});
}
