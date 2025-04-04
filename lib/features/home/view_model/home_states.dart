abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeErrorState extends HomeStates {
  final String error;

  HomeErrorState({required this.error});
}

class HomeUpadateCategoryIndexState extends HomeStates {}

class HomeLoadingProductsState extends HomeStates {}

class HomeErrorProductsState extends HomeStates {
  final String error;

  HomeErrorProductsState({required this.error});
}
