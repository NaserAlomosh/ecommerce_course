import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
part 'widgets/cart_item_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const _CartItemWidget();
        },
      ),
    );
  }
}
