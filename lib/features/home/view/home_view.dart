import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/local/local_storage_service.dart';
import 'package:ecommerce/core/local/user_data.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:ecommerce/core/widgets/cart_icon_builder/view/cart_icon_builder.dart';
import 'package:ecommerce/core/widgets/cart_icon_builder/view_model/cart_icon_builder_cubit.dart';
import 'package:ecommerce/features/cart/view/cart_view.dart';
import 'package:ecommerce/features/favorites/view/favorites_view.dart';
import 'package:ecommerce/features/home/model/category_model.dart';
import 'package:ecommerce/features/home/view_model/home_cubit.dart';
import 'package:ecommerce/features/home/view_model/home_states.dart';
import 'package:ecommerce/features/login/view/login_view.dart';
import 'package:ecommerce/features/product_details/view/product_details_view.dart';
import 'package:ecommerce/features/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
part 'widgets/home_categories.dart';
part 'widgets/home_products_widget.dart';
part 'widgets/empty_products_widget.dart';
part 'widgets/home_drawer_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..getCategories()),
        BlocProvider(create: (context) => CartIconBuilderCubit()..getCount()),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {},
          child: const CartIconBuilder(),
        ),
        drawer: const _HomeDrawerWidget(),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
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
                            ? context.read<HomeCubit>().products.isEmpty
                                ? const _EmptyProductsWidget()
                                : const _HomeProductsWidget()
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
      ),
    );
  }
}
