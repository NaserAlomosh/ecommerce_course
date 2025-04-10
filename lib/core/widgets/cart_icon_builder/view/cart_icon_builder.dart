import 'dart:developer';

import 'package:ecommerce/core/widgets/cart_icon_builder/view_model/cart_icon_builder_cubit.dart';
import 'package:ecommerce/core/widgets/cart_icon_builder/view_model/states.dart';
import 'package:ecommerce/features/cart/view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CartIconBuilder extends StatelessWidget {
  const CartIconBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<CartIconBuilderCubit, CartIconBuilderStates>(
          builder: (context, state) {
            if (state is CartIconBuilderLoading) {
              return const Padding(
                padding: EdgeInsets.all(4),
                child: SizedBox(
                  height: 10,
                  width: 10,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            } else if (state is CartIconBuilderSuccess) {
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final userIsDeletedProduct = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<CartIconBuilderCubit>(),
                            child: const CartView(),
                          ),
                        ),
                      );
                      if (userIsDeletedProduct == true) {
                        context.read<CartIconBuilderCubit>().getCount();
                      } else {
                        log('userIsDeletedProduct: $userIsDeletedProduct');
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Stack(
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    left: 3,
                    child: Text(
                      state.count.toString(),
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is CartIconBuilderError) {
              return GestureDetector(
                onTap: () => context.read<CartIconBuilderCubit>().getCount(),
                child: const Icon(Icons.replay),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
