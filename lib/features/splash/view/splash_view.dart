import 'package:ecommerce/core/theme/app_colors.dart';
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
    Future.delayed(const Duration(seconds: 2)).then((_) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginView()),
        );
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
