abstract class CartStates {}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartSucessState extends CartStates {}

class CartErrorState extends CartStates {
  final String error;

  CartErrorState({required this.error});
}

class CartUpdateCountState extends CartStates {}
