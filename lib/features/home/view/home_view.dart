import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_padding.dart';
import 'package:flutter/material.dart';
part 'widgets/home_categories.dart';
part 'widgets/home_products_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All',
      'Electronics',
      'Jewelery',
      'Men\'s Clothing',
      'Women\'s Clothing',
      'Automotive',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: AppPadding.allPadding,
        child: Column(
          children: [
            _HomeCategoriesWidget(categories: categories),
            const SizedBox(height: 20),
            const _HomeProductsWidget(),
          ],
        ),
      ),
    );
  }
}
