import 'package:ecommerce/features/cart/repo/cart_repo.dart';
import 'package:ecommerce/features/cart/view_model/states.dart';
import 'package:ecommerce/features/product_details/model/prudect_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());
  final _cartRepo = CartRepo();
  List<ProductModel> products = [];
  double totalPrice = 0;
  Future<void> getCartItems() async {
    emit(CartLoadingState());
    final result = await _cartRepo.getCartItems();
    result.fold(
      (error) => emit(CartErrorState(error: error)),
      (products) {
        this.products = products;
        calculateTotal();
        emit(CartSucessState());
      },
    );
  }

  Future<void> updateCount(int index) async {
    final count = products[index].count;
    final productId = products[index].id;
    _cartRepo.updateCount((count ?? 1), productId);
  }

  addCount(int index) {
    products[index].count = (products[index].count ?? 1) + 1;
    calculateTotal();
    updateCount(index);
    emit(CartUpdateCountState());
  }

  removeCount(int index) {
    products[index].count = (products[index].count ?? 1) - 1;
    calculateTotal();
    updateCount(index);
    emit(CartUpdateCountState());
  }

  void calculateTotal() {
    for (var element in products) {
      final totalCountPrice = element.price * (element.count ?? 1);
      totalPrice = totalPrice + totalCountPrice;
      String formattedNumber = totalPrice.toStringAsFixed(2);
      totalPrice = double.parse(formattedNumber);
    }
  }
}
