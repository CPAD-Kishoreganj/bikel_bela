import 'package:bikel_bela/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const route = 'user-product-screen';
  const UserProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('User products'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => UserProductItem(
                productData.items[index].title,
                productData.items[index].imageUrl,
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: productData.items.length),
    );
  }
}
