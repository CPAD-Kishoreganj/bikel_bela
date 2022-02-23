import 'package:bikel_bela/providers/cart.dart';
import 'package:bikel_bela/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.id,
          );
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(
              onPressed: () {
                product.toggleFavorite();
              },
              icon: product.isFavorite
                  ? Icon(
                      Icons.favorite,
                      color: Theme.of(context).primaryColor,
                    )
                  : Icon(
                      Icons.favorite_outline,
                      color: Theme.of(context).primaryColor,
                    ),
            ),
            title: Text(product.title),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(
                  product.id,
                  product.price,
                  product.title,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Item added to cart!!"),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(
                      label: "Undo",
                      onPressed: () {
                        cart.removeSingleItem(product.id);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
