import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/local/user_data.dart';
import 'package:ecommerce/features/product_details/model/prudect_model.dart';

class FavorietsRepo {
  Future<Either<String, List<ProductModel>>> getFavorites() async {
    List<ProductModel> favoritesProduct = [];
    try {
      final result = await FirebaseFirestore.instance
          .collection('users')
          .doc(UserDataService.uid)
          .collection('favorite')
          .get();

      for (var element in result.docs) {
        favoritesProduct.add(ProductModel.fromJson(element.data()));
      }
      return Right(favoritesProduct);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }

  Future<Either<String, void>> removeFromFavorite(String productId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(UserDataService.uid)
          .collection('favorite')
          .doc(productId)
          .delete();
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }
}
