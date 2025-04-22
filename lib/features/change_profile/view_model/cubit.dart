import 'package:ecommerce/core/extension/form_key_extension.dart';
import 'package:ecommerce/core/local/user_data.dart';
import 'package:ecommerce/features/change_profile/repo/change_profile_repo.dart';
import 'package:ecommerce/features/change_profile/view_model/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeProfileCubit extends Cubit<ChangeProfileStates> {
  final _changeProfileRepo = ChangeProfileRepo();
  ChangeProfileCubit() : super(ChangeProfileInitial());
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void getDefaultData() async {
    usernameController.text = UserDataService.username ?? '';
    phoneController.text = UserDataService.phone ?? '';
  }

  void updateProfileData() async {
    if (formKey.isValid()) {
      emit(ChangeProfileLoading());
      final result = await _changeProfileRepo.updateProfileData(
        usernameController.text,
        phoneController.text,
      );
      result.fold(
        (error) => emit(ChangeProfileError(error: error)),
        (_) => emit(ChangeProfileSucess()),
      );
    }
  }
}
