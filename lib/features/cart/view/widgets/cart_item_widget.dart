part of '../cart_view.dart';

class _CartItemWidget extends StatelessWidget {
  const _CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.allPadding,
      child: Container(
        height: 170,
        color: Colors.amber,
        child: Row(
          children: [
            _getProductInfo(),
            Spacer(),
            _getProductImage(),
          ],
        ),
      ),
    );
  }

  Widget _getProductImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CachedNetworkImage(
        imageUrl: 'https://pngfre.com/wp-content/uploads/T-Shirt-13-1-1024x1004.png',
      ),
    );
  }

  Widget _getProductInfo() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'T-shirt',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        Text('data'),
        Text('data'),
        Text(
          '\$30',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
