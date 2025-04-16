import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:ecommerce/core/widgets/cart_icon_builder/view_model/cart_icon_builder_cubit.dart';
import 'package:ecommerce/features/favorites/view_model/cubit.dart';
import 'package:ecommerce/features/favorites/view_model/states.dart';
import 'package:ecommerce/features/product_details/model/prudect_model.dart';
import 'package:ecommerce/features/product_details/view/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
part 'widgets/favorite_item_widget.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavorietsCubit()..getFavorites(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Favorites',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<FavorietsCubit, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else if (state is FavoritesErrorState) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return context.read<FavorietsCubit>().favoriteProducts.isEmpty
                  ? const Center(
                      child: Text(
                        'No Favorites',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: context
                          .read<FavorietsCubit>()
                          .favoriteProducts
                          .length,
                      itemBuilder: (context, index) {
                        return _FavoriteItemWidget(
                          product: context
                              .read<FavorietsCubit>()
                              .favoriteProducts[index],
                        );
                      },
                    );
            }
          },
        ),
      ),
    );
  }
}
