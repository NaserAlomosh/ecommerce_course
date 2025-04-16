abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoadingState extends FavoritesState {}

class FavoritesErrorState extends FavoritesState {
  final String error;

  FavoritesErrorState({required this.error});
}

class FavoritesSuccessState extends FavoritesState {}

class FavoritesUpdateState extends FavoritesState {}
