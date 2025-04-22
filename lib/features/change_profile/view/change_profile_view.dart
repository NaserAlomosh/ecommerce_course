import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:ecommerce/core/widgets/buttons/custom_button.dart';
import 'package:ecommerce/core/widgets/loading/custom_loading_widget.dart';
import 'package:ecommerce/core/widgets/textfieds/custom_text_field.dart';
import 'package:ecommerce/core/widgets/toast_message/toast_message.dart';
import 'package:ecommerce/features/change_profile/view_model/cubit.dart';
import 'package:ecommerce/features/change_profile/view_model/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeProfileView extends StatelessWidget {
  const ChangeProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeProfileCubit()..getDefaultData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: Colors.white,
        ),
        body: BlocListener<ChangeProfileCubit, ChangeProfileStates>(
          listener: (context, state) {
            if (state is ChangeProfileLoading) {
              CustomDialogLoadingWidget.show(context);
            } else if (state is ChangeProfileSucess) {
              Navigator.pop(context);
              Navigator.pop(context);
              ToastMessage.showSuccessMessage(
                context,
                'Profile updated successfully',
              );
            } else if (state is ChangeProfileError) {
              Navigator.pop(context);
              ToastMessage.showErrorMessage(context, state.error);
            }
          },
          child: Padding(
            padding: AppPadding.allPadding,
            child: SingleChildScrollView(
              child: Builder(
                builder: (context) {
                  return Form(
                    key: context.read<ChangeProfileCubit>().formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: context
                              .read<ChangeProfileCubit>()
                              .usernameController,
                          validator: (username) {
                            if (username?.isEmpty ?? true) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          label: 'Username',
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: 'Phone',
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          controller: context
                              .read<ChangeProfileCubit>()
                              .phoneController,
                          validator: (phone) {
                            if (phone?.isEmpty ?? true) {
                              return 'Please enter your phone number';
                            } else if (!((phone?.length ?? 0) == 10)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          text: 'Save',
                          onTap: () {
                            context
                                .read<ChangeProfileCubit>()
                                .updateProfileData();
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
