abstract class ProductDetailsStates {}

class ProductDetailsInitial extends ProductDetailsStates {}

class AddToCartLoading extends ProductDetailsStates {}

class AddToCartSucess extends ProductDetailsStates {}

class AddToCartError extends ProductDetailsStates {
  final String error;

  AddToCartError({required this.error});
}

class GetUpdateFavoriteIcon extends ProductDetailsStates {}

class GetFavoriteLoading extends ProductDetailsStates {}

class GetFavoriteSucess extends ProductDetailsStates {}

class GetFavoriteError extends ProductDetailsStates {
  final String error;

  GetFavoriteError({required this.error});
}
