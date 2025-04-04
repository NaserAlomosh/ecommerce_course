import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:ecommerce/features/home/model/category_model.dart';
import 'package:ecommerce/features/home/view_model/home_cubit.dart';
import 'package:ecommerce/features/home/view_model/home_states.dart';
import 'package:ecommerce/features/product_details/view/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
part 'widgets/home_categories.dart';
part 'widgets/home_products_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCategories(),
      child: Scaffold(
        drawer: const Drawer(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            getCartIcon(context),
          ],
          backgroundColor: Colors.white,
        ),
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
                      _HomeCategoriesWidget(
                        categories: context.read<HomeCubit>().categories,
                      ),
                      const SizedBox(height: 20),
                      state is! HomeLoadingState &&
                              state is! HomeErrorState &&
                              state is! HomeLoadingProductsState &&
                              state is! HomeErrorProductsState
                          ? const _HomeProductsWidget()
                          : const Expanded(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
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

  Widget getCartIcon(context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Stack(
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: Text(
            '0',
            style: GoogleFonts.poppins(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
