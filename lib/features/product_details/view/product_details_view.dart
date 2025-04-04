import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:ecommerce/core/widgets/buttons/custom_button.dart';
import 'package:ecommerce/features/home/model/prudect_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              CachedNetworkImage(
                imageUrl: product.image,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                product.description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              RatingBarIndicator(
                rating: 4,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 30.0,
                direction: Axis.horizontal,
              ),
              const Spacer(),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: CustomButton(
                      text: 'Add to Cart',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: CustomButton(
                      color: Colors.grey,
                      text: '\$${product.price}',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
