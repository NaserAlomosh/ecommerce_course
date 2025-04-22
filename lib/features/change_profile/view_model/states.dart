abstract class ChangeProfileStates {}

class ChangeProfileInitial extends ChangeProfileStates {}

class ChangeProfileLoading extends ChangeProfileStates {}

class ChangeProfileError extends ChangeProfileStates {
  final String error;
  ChangeProfileError({required this.error});
}

class ChangeProfileSucess extends ChangeProfileStates {}
