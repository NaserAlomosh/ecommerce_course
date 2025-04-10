import 'package:ecommerce/core/widgets/cart_icon_builder/view_model/states.dart';
import 'package:ecommerce/features/cart/repo/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartIconBuilderCubit extends Cubit<CartIconBuilderStates> {
  CartIconBuilderCubit() : super(CartIconBuilderInitial());
  int count = 0;
  final _cartRepo = CartRepo();
  Future<void> getCount() async {
    emit(CartIconBuilderLoading());
    final result = await _cartRepo.getCount();
    result.fold(
      (error) => emit(CartIconBuilderError(error: error)),
      (count) {
        this.count = count;
        emit(CartIconBuilderSuccess(count: count));
      },
    );
  }
}
