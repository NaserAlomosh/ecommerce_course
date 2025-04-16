part of '../favorites_view.dart';

class _FavoriteItemWidget extends StatelessWidget {
  const _FavoriteItemWidget({required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        background: Container(
          color: Colors.red,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        onDismissed: (_) {
          context.read<FavorietsCubit>().removeFromFavorite(product);
        },
        key: UniqueKey(),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<CartIconBuilderCubit>(),
                  child: ProductDetailsView(product: product),
                ),
              ),
            );
          },
          child: Material(
            color: Colors.white,
            elevation: 8,
            child: Container(
              height: 160,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  _getImage(product.image),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _getName(product.name),
                          _getPrice(product.price),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getImage(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: double.infinity,
      width: 100,
    );
  }

  Widget _getName(String title) {
    return Expanded(
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _getPrice(double price) {
    return Text(
      '\$$price',
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
