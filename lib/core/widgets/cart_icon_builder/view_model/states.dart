abstract class CartIconBuilderStates {}

class CartIconBuilderInitial extends CartIconBuilderStates {}

class CartIconBuilderSuccess extends CartIconBuilderStates {
  final int count;

  CartIconBuilderSuccess({required this.count});
}

class CartIconBuilderError extends CartIconBuilderStates {
  final String error;

  CartIconBuilderError({required this.error});
}

class CartIconBuilderLoading extends CartIconBuilderStates {}
