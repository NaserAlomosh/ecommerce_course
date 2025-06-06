import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/model/category_model.dart';
import 'package:ecommerce/features/product_details/model/prudect_model.dart';

class HomeRepo {
  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      List<CategoryModel> categories = [];
      final snapshot = await FirebaseFirestore.instance.collection('categories').get();
      for (var element in snapshot.docs) {
        categories.add(CategoryModel.formJson(element.data()));
      }
      return Right(categories);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }

  Future<Either<String, List<ProductModel>>> getProductsByCategoryId(
    String categoryId,
  ) async {
    try {
      List<ProductModel> products = [];
      final snapshot = await FirebaseFirestore.instance
          .collection('categories')
          .doc(categoryId)
          .collection('product')
          .get();

      for (var element in snapshot.docs) {
        products.add(ProductModel.fromJson(element.data()));
      }
      return Right(products);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }
}
