import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:ecommerce/features/home/model/category_model.dart';
import 'package:ecommerce/features/home/view_model/home_cubit.dart';
import 'package:ecommerce/features/home/view_model/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'widgets/home_categories.dart';
part 'widgets/home_products_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All',
      'Electronics',
      'Jewelery',
      'Men\'s Clothing',
      'Women\'s Clothing',
      'Automotive',
    ];
    return BlocProvider(
      create: (context) => HomeCubit()..getCategories(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Padding(
          padding: AppPadding.allPadding,
          child: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeErrorState) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                return RefreshIndicator(
                  backgroundColor: AppColors.primary,
                  color: Colors.white,
                  onRefresh: () async {
                    await context.read<HomeCubit>().getCategories();
                  },
                  child: Column(
                    children: [
                      _HomeCategoriesWidget(categories: context.read<HomeCubit>().categories),
                      const SizedBox(height: 20),
                      const _HomeProductsWidget(),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
