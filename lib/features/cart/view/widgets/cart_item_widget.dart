part of '../cart_view.dart';

class _CartItemWidget extends StatelessWidget {
  const _CartItemWidget({super.key, required this.product, required this.index});
  final ProductModel product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Card(
          elevation: 5,
          child: Container(
            height: 120,
            color: Colors.white,
            child: Row(
              children: [
                _getProductImage(),
                _getProductInfo(),
                const Spacer(),
                _CounterWidget(index: index),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getProductImage() {
    return SizedBox(
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CachedNetworkImage(
          imageUrl: product.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _getProductInfo() {
    return SizedBox(
      width: 140,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              product.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            const Spacer(),
            Text(
              '\$${product.price}',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
