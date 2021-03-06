import 'package:bikel_bela/providers/products.dart';
import 'package:bikel_bela/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/user_product_item.dart';
import 'edit_user_products_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const route = 'user-product-screen';
  const UserProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditUserProductsScreen.route);
            },
            icon: const Icon(Icons.add, color: Color(0xFF15298E),),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView.separated(
          itemBuilder: (context, index) => UserProductItem(
                productData.items[index].title,
                productData.items[index].imageUrl,
              ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: productData.items.length),
    );
  }
}
