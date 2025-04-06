abstract class ProductDetailsStates {}

class ProductDetailsInitial extends ProductDetailsStates {}

class AddToCartLoading extends ProductDetailsStates {}

class AddToCartSucess extends ProductDetailsStates {}

class AddToCartError extends ProductDetailsStates {
  final String error;

  AddToCartError({required this.error});
}
