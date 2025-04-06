import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:ecommerce/core/widgets/buttons/custom_button.dart';
import 'package:ecommerce/core/widgets/loading/custom_loading_widget.dart';
import 'package:ecommerce/core/widgets/snakbar/custom_snak_bar.dart';
import 'package:ecommerce/features/product_details/model/prudect_model.dart';
import 'package:ecommerce/features/product_details/view_model/product_details_cubit.dart';
import 'package:ecommerce/features/product_details/view_model/product_details_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
part 'widgets/products_details_widget.dart';
part 'widgets/add_to_cart_button_widget.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(product: product),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: const [
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            SizedBox(width: 20),
            Icon(
              Icons.share,
              color: Colors.black,
            ),
            SizedBox(width: 20),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: AppPadding.allPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProductsDetailsWidget(product: product),
                const Spacer(),
                const _AddToCartButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
