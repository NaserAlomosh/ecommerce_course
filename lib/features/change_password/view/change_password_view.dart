import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:ecommerce/core/widgets/buttons/custom_button.dart';
import 'package:ecommerce/core/widgets/loading/custom_loading_widget.dart';
import 'package:ecommerce/core/widgets/textfieds/custom_text_field.dart';
import 'package:ecommerce/core/widgets/toast_message/toast_message.dart';
import 'package:ecommerce/features/change_password/view_model/cubit.dart';
import 'package:ecommerce/features/change_password/view_model/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Change Password',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: AppPadding.allPadding,
          child: SingleChildScrollView(
            child: BlocListener<ChangePasswordCubit, ChangePasswordStates>(
              listener: (context, state) {
                if (state is ChangePasswordLoading) {
                  CustomDialogLoadingWidget.show(context);
                } else if (state is ChangePasswordError) {
                  Navigator.pop(context);
                  ToastMessage.showErrorMessage(context, state.error);
                } else if (state is ChangePasswordSucess) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  ToastMessage.showSuccessMessage(context, state.message);
                }
              },
              child: Builder(
                builder: (BuildContext context) {
                  return Form(
                    key: context.read<ChangePasswordCubit>().formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        CustomTextField(
                          obscureText: true,
                          label: 'Old Password',
                          controller:
                              context.read<ChangePasswordCubit>().oldPasswordController,
                          validator: (password) {
                            if (password?.isEmpty ?? true) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          obscureText: true,
                          label: 'New Password',
                          validator: (password) {
                            if (password?.isEmpty ?? true) {
                              return 'Please enter your password';
                            } else if ((password?.length ?? 0) < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          controller:
                              context.read<ChangePasswordCubit>().newPasswordController,
                        ),
                        const SizedBox(height: 60),
                        CustomButton(
                          text: 'Confirm',
                          onTap: () {
                            context.read<ChangePasswordCubit>().changePassword();
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
