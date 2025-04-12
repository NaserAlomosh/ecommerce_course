import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:ecommerce/core/widgets/buttons/custom_button.dart';
import 'package:ecommerce/features/cart/view_model/cubit.dart';
import 'package:ecommerce/features/cart/view_model/states.dart';
import 'package:ecommerce/features/product_details/model/prudect_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
part 'widgets/cart_item_widget.dart';
part 'widgets/counter_widget.dart';
part 'widgets/checkout_button_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCartItems(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Cart',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<CartCubit, CartStates>(
            buildWhen: (_, current) {
              return current is! CartUpdateCountState;
            },
            builder: (context, state) {
              if (state is CartLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CartErrorState) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                if (context.read<CartCubit>().products.isEmpty) {
                  return Padding(
                    padding: AppPadding.allPadding,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.primary,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Cart is Empty',
                          style: GoogleFonts.poppins(
                            color: AppColors.primary,
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: context.read<CartCubit>().products.length,
                          itemBuilder: (context, index) {
                            return _CartItemWidget(
                              product:
                                  context.read<CartCubit>().products[index],
                              index: index,
                            );
                          },
                        ),
                      ),
                      const _CheckOutButtonWidget()
                    ],
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
