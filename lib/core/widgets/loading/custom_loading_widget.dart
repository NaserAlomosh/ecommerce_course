import 'package:ecommerce/core/theme/app_colors.dart' show AppColors;
import 'package:flutter/material.dart';

class CustomDialogLoadingWidget extends StatelessWidget {
  const CustomDialogLoadingWidget({super.key});

  static void show(BuildContext context) {
    showDialog(context: context, builder: (context) => const CustomDialogLoadingWidget());
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
      ),
    );
  }
}
