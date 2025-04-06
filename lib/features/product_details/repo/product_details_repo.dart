import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/local/user_data.dart';
import 'package:ecommerce/features/product_details/model/prudect_model.dart';

class ProductDetailsRepo {
  Future<Either<String, bool>> addToCart({required ProductModel productDetails}) async {
    try {
      final result = await _checkIfProductExistsInCart(productDetails.id);

      result.fold(
        (_) async => await _addNewProductToCart(productDetails),
        (productFromCart) async => await _updateProductCount(productFromCart),
      );

      return const Right(true);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }

  Future<void> _addNewProductToCart(ProductModel product) async {
    product.count = 1;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(UserDataService.uid)
        .collection('cart')
        .doc(product.id)
        .set(product.toJson());
    log('Added New Product DATA ${product.toJson()}');
  }

  Future<void> _updateProductCount(ProductModel product) async {
    product.count = (product.count ?? 0) + 1;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(UserDataService.uid)
        .collection('cart')
        .doc(product.id)
        .update(product.toJson());
    log('Update Product DATA ${product.toJson()}');
  }

  Future<Either<void, ProductModel>> _checkIfProductExistsInCart(String id) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .doc(UserDataService.uid)
        .collection('cart')
        .doc(id)
        .get();

    if (result.exists) {
      ProductModel product = ProductModel.fromJson(result.data() ?? {});
      return Right(product);
    } else {
      return const Left(null);
    }
  }
}
