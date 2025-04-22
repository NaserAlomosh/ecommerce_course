part of '../home_view.dart';

class _HomeListProductsWidget extends StatelessWidget {
  const _HomeListProductsWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) => current is HomeSearchState,
      builder: (context, state) {
        return Expanded(
          child: GridView.builder(
            itemCount: context.read<HomeCubit>().searchController.text.isEmpty
                ? context.read<HomeCubit>().products.length
                : context.read<HomeCubit>().searchProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 260,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: context.read<CartIconBuilderCubit>(),
                        child: ProductDetailsView(
                          product: context.read<HomeCubit>().searchController.text.isEmpty
                              ? context.read<HomeCubit>().products[index]
                              : context.read<HomeCubit>().searchProducts[index],
                        ),
                      ),
                    ),
                  );
                },
                child: _getItemWidget(
                  context.read<HomeCubit>().searchController.text.isEmpty
                      ? context.read<HomeCubit>().products[index]
                      : context.read<HomeCubit>().searchProducts[index],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _getItemWidget(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                height: 140,
                fit: BoxFit.cover,
                width: double.infinity,
                imageUrl: product.image,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(height: 4),
              Text(
                'Product Name :${product.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Price: \$${product.price}',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const Spacer(),
              RatingBarIndicator(
                rating: 2.75,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20,
                direction: Axis.horizontal,
              ),
              const SizedBox(height: 4)
            ],
          ),
        ),
      ),
    );
  }
}
