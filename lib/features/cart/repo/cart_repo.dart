import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/local/user_data.dart';
import 'package:ecommerce/features/product_details/model/prudect_model.dart';

class CartRepo {
  Future<Either<String, List<ProductModel>>> getCartItems() async {
    List<ProductModel> products = [];
    try {
      final result = await FirebaseFirestore.instance
          .collection('users')
          .doc(UserDataService.uid)
          .collection('cart')
          .get();

      for (var element in result.docs) {
        products.add(ProductModel.fromJson(element.data()));
      }
      return Right(products);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }

  Future<Either<String, void>> updateCount(int count, String productId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(UserDataService.uid)
          .collection('cart')
          .doc(productId)
          .update({'count': count});
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }
}
