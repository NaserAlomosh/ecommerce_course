part of '../product_details_view.dart';

class _ProductsDetailsWidget extends StatelessWidget {
  const _ProductsDetailsWidget({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
