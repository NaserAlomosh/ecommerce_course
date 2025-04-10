part of '../cart_view.dart';

class _CounterWidget extends StatefulWidget {
  const _CounterWidget({super.key, required this.index});
  final int index;

  @override
  State<_CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<_CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      buildWhen: (_, current) {
        return current is CartUpdateCountState;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CloseButton(
                onPressed: () {
                  final productId =
                      context.read<CartCubit>().products[widget.index].id;
                  context.read<CartCubit>().removeProduct(productId);
                },
              ),
              const Spacer(),
              Row(
                children: [
                  InkWell(
                    radius: 50,
                    onTap: () {
                      context.read<CartCubit>().addCount(widget.index);
                    },
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    context
                        .read<CartCubit>()
                        .products[widget.index]
                        .count
                        .toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 6),
                  InkWell(
                    radius: 50,
                    onTap: () {
                      context.read<CartCubit>().removeCount(widget.index);
                    },
                    child: const Icon(
                      Icons.remove,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
            ],
          ),
        );
      },
    );
  }
}
