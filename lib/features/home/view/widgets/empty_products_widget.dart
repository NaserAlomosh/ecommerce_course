part of '../home_view.dart';

class _EmptyProductsWidget extends StatelessWidget {
  const _EmptyProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.primary,
            ),
          ),
          child: Center(
            child: Text(
              'No products found',
              style: GoogleFonts.poppins(color: AppColors.primary),
            ),
          ),
        ),
      ),
    );
  }
}
