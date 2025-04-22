part of '../home_view.dart';

class _SearchTextFieldWidget extends StatelessWidget {
  const _SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onChanged: (name) {
        context.read<HomeCubit>().searchProductsByName(name);
      },
      controller: context.read<HomeCubit>().searchController,
      label: 'Search',
      prefixIcon: const Icon(
        Icons.search,
        color: AppColors.primary,
      ),
    );
  }
}
