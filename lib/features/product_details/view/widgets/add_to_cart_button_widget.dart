part of '../product_details_view.dart';

class _AddToCartButtonWidget extends StatelessWidget {
  const _AddToCartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductDetailsCubit, ProductDetailsStates>(
      listener: (context, state) => _stateHandler(context, state),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: CustomButton(
              text: 'Add to Cart',
              onTap: () {
                context.read<ProductDetailsCubit>().addToCart(context);
              },
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: CustomButton(
              color: Colors.grey,
              text: '\$${context.read<ProductDetailsCubit>().product.price}',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  void _stateHandler(BuildContext context, ProductDetailsStates state) {
    if (state is AddToCartLoading) {
      CustomDialogLoadingWidget.show(context);
    } else if (state is AddToCartSucess) {
      Navigator.pop(context);
      CustomSnakBar.show(context, 'Product added to cart', color: Colors.green);
    } else if (state is AddToCartError) {
      Navigator.pop(context);
      CustomSnakBar.show(context, state.error);
    }
  }
}
