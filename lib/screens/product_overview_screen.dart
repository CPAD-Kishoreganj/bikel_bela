import 'package:bikel_bela/widgets/badge.dart';
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
            icon: Icon(Icons.settings),
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
          ),
          Badge(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
            value: '10',
            color: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ProductsGrid(_showOnlyFavorites),
      ),
    );
  }
}
