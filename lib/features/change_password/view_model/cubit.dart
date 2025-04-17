import 'package:ecommerce/core/extension/form_key_extension.dart';
import 'package:ecommerce/features/change_password/repo/change_password_repo.dart';
import 'package:ecommerce/features/change_password/view_model/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordStates> {
  final _changePasswordRepo = ChangePasswordRepo();
  ChangePasswordCubit() : super(ChangePasswordInitial());

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void changePassword() async {
    if (formKey.isValid()) {
      emit(ChangePasswordLoading());
      final result = await _changePasswordRepo.changePassword(
        newPasswordController.text,
        oldPasswordController.text,
      );
      result.fold(
        (error) => emit(ChangePasswordError(error: error)),
        (message) => emit(ChangePasswordSucess(message: message)),
      );
    }
  }
}
