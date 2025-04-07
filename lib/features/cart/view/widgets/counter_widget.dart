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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Spacer(),
          Row(
            children: [
              InkWell(
                radius: 50,
                onTap: () {
                  context.read<CartCubit>().addCount(widget.index);
                },
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
              SizedBox(width: 6),
              Text(
                context.read<CartCubit>().products[widget.index].count.toString(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 6),
              InkWell(
                radius: 50,
                onTap: () {
                  context.read<CartCubit>().removeCount(widget.index);
                },
                child: Icon(
                  Icons.remove,
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }
}
