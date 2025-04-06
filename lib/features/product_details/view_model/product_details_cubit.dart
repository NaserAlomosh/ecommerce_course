import 'package:ecommerce/features/product_details/model/prudect_model.dart';
import 'package:ecommerce/features/product_details/repo/product_details_repo.dart';
import 'package:ecommerce/features/product_details/view_model/product_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit({required this.product}) : super(ProductDetailsInitial());
  final ProductDetailsRepo _productDetailsRepo = ProductDetailsRepo();
  final ProductModel product;
  Future<void> addToCart() async {
    emit(AddToCartLoading());
    final result = await _productDetailsRepo.addToCart(productDetails: product);
    result.fold(
      (error) => emit(AddToCartError(error: error)),
      (_) => emit(AddToCartSucess()),
    );
  }
}
