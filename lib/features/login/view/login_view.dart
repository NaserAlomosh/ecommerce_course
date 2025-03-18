import 'dart:developer';

import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:ecommerce/core/widgets/buttons/custom_button.dart';
import 'package:ecommerce/features/login/view_model/states.dart';
import 'package:ecommerce/features/signup/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../core/theme/app_images.dart';
import '../../../core/widgets/loading/custom_loading_widget.dart';
import '../../../core/widgets/snakbar/custom_snak_bar.dart';
import '../../../core/widgets/textfieds/custom_text_field.dart';
import '../../home/view/home_view.dart';
import '../view_model/cubit.dart';
part 'widgets/login_form.dart';

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
                          child: BlocListener<LoginCubit, LoginStates>(
                            listener: (context, state) => _handleLoginState(state),
                            child: const _LoginFormWidget(),
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

  void _handleLoginState(LoginStates state) {
    if (state is LoginSucessState) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeView(),
        ),
      );
    } else if (state is LoginErrorState) {
      Navigator.pop(context);
      CustomSnakBar.show(context, state.error);
    } else if (state is LoginLoadingState) {
      CustomDialogLoadingWidget.show(context);
    }
  }
}
