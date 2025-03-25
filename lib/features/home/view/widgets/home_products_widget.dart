part of '../home_view.dart';

class _HomeProductsWidget extends StatelessWidget {
  const _HomeProductsWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // ProductDetailsView
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/e/eb/Baseball_cap.jpg',
                        height: 100,
                      ),
                      const Text('Product Name : Cap'),
                      const Text('Price: \$5'),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
