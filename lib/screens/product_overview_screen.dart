import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

enum FilterOption { showFav, showAll }

class ProductOverviewScreen extends StatefulWidget {
  ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption value) {
              setState(() {
                if (value == FilterOption.showFav) {
                  _showOnlyFavorites = true;
                } else if (value == FilterOption.showAll) {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  value: FilterOption.showFav,
                  child: Text('Only Fav'),
                ),
                PopupMenuItem(
                  value: FilterOption.showAll,
                  child: Text('Show all'),
                ),
              ];
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ProductsGrid(_showOnlyFavorites),
      ),
    );
  }
}
