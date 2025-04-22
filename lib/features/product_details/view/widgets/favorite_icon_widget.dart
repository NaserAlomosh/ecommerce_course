part of '../product_details_view.dart';

class _FavoriteIconWidget extends StatelessWidget {
  const _FavoriteIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
      buildWhen: (_, current) =>
          current is GetFavoriteLoading ||
          current is GetFavoriteSucess ||
          current is GetFavoriteError,
      builder: (context, state) {
        if (state is GetFavoriteLoading) {
          return const SizedBox(
            height: 16,
            width: 16,
            child: CircularProgressIndicator(),
          );
        }
        return context.read<ProductDetailsCubit>().isFavorite
            ? GestureDetector(
                onTap: () {
                  context.read<ProductDetailsCubit>().removeFromFavorite(context);
                },
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              )
            : GestureDetector(
                onTap: () {
                  context.read<ProductDetailsCubit>().addToFavorite(context);
                },
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
              );
      },
    );
  }
}
