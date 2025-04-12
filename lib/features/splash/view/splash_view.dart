import 'package:ecommerce/core/local/local_storage_service.dart';
import 'package:ecommerce/core/local/user_data.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/features/home/view/home_view.dart';
import 'package:ecommerce/features/login/model/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/theme/app_images.dart';
import '../../login/view/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _goToLogin();
  }

  void _goToLogin() {
    Future.delayed(const Duration(seconds: 2)).then((_) async {
      final isLogin = await LocalStorageService.instance.getUserIsLogin();
      if (isLogin) {
        LoginResponseModel userData =
            await LocalStorageService.instance.getUserData();
        UserDataService.setUserData(userData);
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeView()),
          );
        }
      } else {
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginView()),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Lottie.asset(
          AppImages.splashLogo,
          width: MediaQuery.of(context).size.width / 2.5,
        ),
      ),
    );
  }
}
