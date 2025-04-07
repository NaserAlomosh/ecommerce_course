part of '../cart_view.dart';

class _CheckOutButtonWidget extends StatelessWidget {
  const _CheckOutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      buildWhen: (_, current) {
        return current is CartUpdateCountState;
      },
      builder: (context, state) {
        return Padding(
          padding: AppPadding.horizontalPadding,
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: CustomButton(
                  text: 'Checkout',
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 3,
                child: CustomButton(
                  color: Colors.grey,
                  text: 'Total: \$${context.read<CartCubit>().totalPrice}',
                  onTap: () {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
