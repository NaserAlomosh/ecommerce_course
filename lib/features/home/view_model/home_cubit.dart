import 'package:ecommerce/features/home/model/category_model.dart';
import 'package:ecommerce/features/home/repo/home_repo.dart';
import 'package:ecommerce/features/home/view_model/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  final homeRepo = HomeRepo();
  List<CategoryModel> categories = [];
  int selectedIndex = 0;

  Future<void> getCategories() async {
    emit(HomeLoadingState());
    final result = await homeRepo.getCategories();
    result.fold(
      (error) => emit(HomeErrorState(error: error)),
      (categories) {
        this.categories = categories;
        emit(HomeSuccessState());
      },
    );
  }

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(HomeUpadateCategoryIndexState());
  }
}
