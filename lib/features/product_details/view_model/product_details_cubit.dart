import 'dart:developer';

import 'package:ecommerce/core/widgets/cart_icon_builder/view_model/cart_icon_builder_cubit.dart';
import 'package:ecommerce/features/favorites/view_model/cubit.dart';
import 'package:ecommerce/features/product_details/model/prudect_model.dart';
import 'package:ecommerce/features/product_details/repo/product_details_repo.dart';
import 'package:ecommerce/features/product_details/view_model/product_details_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit({
    required this.product,
    this.fromFavorite = false,
  }) : super(ProductDetailsInitial());
  final ProductDetailsRepo _productDetailsRepo = ProductDetailsRepo();
  final ProductModel product;
  final bool fromFavorite;
  bool isFavorite = false;
  Future<void> addToCart(BuildContext context) async {
    emit(AddToCartLoading());
    final result = await _productDetailsRepo.addToCart(productDetails: product);
    result.fold(
      (error) => emit(AddToCartError(error: error)),
      (_) => updateCartCount(context),
    );
  }

  Future<void> updateCartCount(BuildContext context) async {
    if (context.mounted) {
      await context.read<CartIconBuilderCubit>().getCount();
      emit(AddToCartSucess());
    }
  }

  Future<void> checkIfProductIsExistsInFavorite() async {
    emit(GetFavoriteLoading());
    final result = await _productDetailsRepo.checkIfProductIsExistsInFavorite(
      product.id,
    );
    result.fold(
      (error) => emit(GetFavoriteError(error: error)),
      (exists) {
        isFavorite = exists;
        emit(GetFavoriteSucess());
      },
    );
  }

  Future<void> addToFavorite(BuildContext context) async {
    isFavorite = true;
    emit(GetFavoriteSucess());
    final result = await _productDetailsRepo.addToFavorite(product);
    if (fromFavorite) {
      log('from favorite');
      if (context.mounted) {
        log('context is mounted');
        context.read<FavorietsCubit>().getFavorites();
      }
    }
    result.fold(
      (error) => emit(GetFavoriteError(error: error)),
      (_) {},
    );
  }

  Future<void> removeFromFavorite(BuildContext context) async {
    isFavorite = false;
    emit(GetFavoriteSucess());
    final result = await _productDetailsRepo.removeFromFavorite(product.id);
    if (fromFavorite) {
      log('from favorite');
      if (context.mounted) {
        log('context is mounted');
        context.read<FavorietsCubit>().getFavorites();
      }
    }
    result.fold(
      (error) => emit(GetFavoriteError(error: error)),
      (_) {},
    );
  }
}
