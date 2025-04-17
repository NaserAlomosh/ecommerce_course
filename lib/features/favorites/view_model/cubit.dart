import 'package:ecommerce/features/favorites/repo/favoriets_repo.dart';
import 'package:ecommerce/features/favorites/view_model/states.dart';
import 'package:ecommerce/features/product_details/model/prudect_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavorietsCubit extends Cubit<FavoritesState> {
  final _favorietsRepo = FavorietsRepo();
  FavorietsCubit() : super(FavoritesInitial());

  List<ProductModel> favoriteProducts = [];
  Future<void> getFavorites() async {
    emit(FavoritesLoadingState());
    final result = await _favorietsRepo.getFavorites();

    result.fold(
      (error) => emit(FavoritesErrorState(error: error)),
      (products) {
        favoriteProducts = products;
        emit(FavoritesSuccessState());
      },
    );
  }

  Future<void> removeFromFavorite(ProductModel product) async {
    favoriteProducts.remove(product);
    if (favoriteProducts.isEmpty) {
      emit(FavoritesUpdateState());
    }
    _favorietsRepo.removeFromFavorite(product.id);
  }
}
