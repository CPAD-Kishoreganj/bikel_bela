import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: ProductsGrid(),
      ),
    );
  }
}
