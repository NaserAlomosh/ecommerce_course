import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:ecommerce/core/widgets/buttons/custom_button.dart';
import 'package:ecommerce/core/widgets/loading/custom_loading_widget.dart'
    show CustomDialogLoadingWidget, CustomLoadingWidget;
import 'package:ecommerce/core/widgets/textfieds/custom_text_field.dart';
import 'package:ecommerce/features/signup/view_model/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/snakbar/custom_snak_bar.dart' show CustomSnakBar;
import '../../login/view/login_view.dart';
import '../view_model/signup_states.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: AppPadding.allPadding,
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.6,
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: AppPadding.allPadding,
                  child: SingleChildScrollView(
                    child: BlocListener<SignupCubit, SignupStates>(
                      listener: (context, state) {
                        if (state is SignupLoadingState) {
                          CustomDialogLoadingWidget.show(context);
                        } else if (state is SignupErrorState) {
                          Navigator.pop(context);
                          CustomSnakBar.show(context, state.error);
                        } else if (state is SignupSucessState) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginView(),
                            ),
                          );
                        }
                      },
                      child: Builder(
                        builder: (context) {
                          return Form(
                            key: context.read<SignupCubit>().formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome to ShopEase',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Discover amazing deals & shop effortlessly!',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                CustomTextField(
                                  controller: context.read<SignupCubit>().usernameController,
                                  label: 'username',
                                  validator: (username) {
                                    if (username?.isEmpty ?? true) {
                                      return 'Please enter your username';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                CustomTextField(
                                  controller: context.read<SignupCubit>().phoneController,
                                  label: 'phone',
                                  keyboardType: TextInputType.phone,
                                  maxLength: 10,
                                  validator: (phone) {
                                    if (phone?.isEmpty ?? true) {
                                      return 'Please enter your phone number';
                                    } else if (!((phone?.length ?? 0) == 10)) {
                                      return 'Please enter a valid phone number';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                CustomTextField(
                                  controller: context.read<SignupCubit>().emailController,
                                  label: 'email',
                                  validator: (email) {
                                    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                                    RegExp regex = RegExp(pattern);
                                    if (email?.isEmpty ?? true) {
                                      return 'Please enter your email';
                                    } else if (!regex.hasMatch(email ?? '')) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                CustomTextField(
                                  controller: context.read<SignupCubit>().passwordController,
                                  label: 'password',
                                  validator: (password) {
                                    if (password?.isEmpty ?? true) {
                                      return 'Please enter your password';
                                    } else if ((password?.length ?? 0) < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                ),
                                const SizedBox(height: 10),
                                CustomTextField(
                                  controller: context.read<SignupCubit>().confirmPasswordController,
                                  label: 'confirm password',
                                  obscureText: true,
                                  validator: (confirmPassword) {
                                    if (confirmPassword?.isEmpty ?? true) {
                                      return 'Please enter your confirm password';
                                    } else if (confirmPassword != context.read<SignupCubit>().passwordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 38),
                                CustomButton(
                                  text: 'Create Account',
                                  onTap: () {
                                    context.read<SignupCubit>().createAccount();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
