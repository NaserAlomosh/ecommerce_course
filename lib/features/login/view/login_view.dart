import 'dart:developer';

import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:ecommerce/core/widgets/buttons/custom_button.dart';
import 'package:ecommerce/features/login/view_model/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../core/theme/app_images.dart';
import '../../../core/widgets/textfieds/custom_text_field.dart';
import '../../home/view/home_view.dart';
import '../view_model/cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    log('Screen is Rebuild');
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Lottie.asset(
                  AppImages.loginLogo,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Center(
                  child: Padding(
                    padding: AppPadding.horizontalPadding,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Padding(
                          padding: AppPadding.allPadding,
                          child: BlocConsumer<LoginCubit, LoginStates>(
                            listener: (context, state) {
                              if (state is LoginSucessState) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const HomeView(),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is LoginLoadingState) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return Form(
                                  key: context.read<LoginCubit>().formKey,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 10),
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
                                          validator: (email) {
                                            if (email?.isEmpty ?? true) {
                                              return 'Please enter your email';
                                            }
                                            return null;
                                          },
                                          controller: context.read<LoginCubit>().emailController,
                                          label: 'Email',
                                          keyboardType: TextInputType.emailAddress,
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTextField(
                                          controller: context.read<LoginCubit>().passwordController,
                                          validator: (password) {
                                            if (password?.isEmpty ?? true) {
                                              return 'Please enter your password';
                                            }
                                            return null;
                                          },
                                          obscureText: true,
                                          keyboardType: TextInputType.visiblePassword,
                                          label: 'Password',
                                        ),
                                        const SizedBox(height: 10),
                                        GestureDetector(
                                          onTap: () {},
                                          child: const Text(
                                            'Forgot Password ?',
                                            style: TextStyle(
                                              decoration: TextDecoration.underline,
                                              decorationColor: AppColors.primary,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 30),
                                        Align(
                                          alignment: Alignment.center,
                                          child: CustomButton(
                                            width: 200,
                                            text: 'Login',
                                            onTap: () {
                                              // setState(() {});
                                              context.read<LoginCubit>().login();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevents dismissing by tapping outside the dialog
    builder: (BuildContext context) {
      return const AlertDialog(
        content: SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(),
        ),
      );
    },
  );
}
