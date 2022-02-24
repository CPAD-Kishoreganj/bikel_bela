import 'package:bikel_bela/providers/cart.dart' show Cart;
import 'package:bikel_bela/providers/orders.dart';
import 'package:bikel_bela/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bikel_bela/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const route = 'cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            CircleAvatar(
              backgroundColor: Colors.red,
            ),
            SizedBox(width: 8),
            Text("Your cart"),
          ],
        ),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontSize: 24),
                  ),
                  const Spacer(),
                  Chip(
                    backgroundColor: Colors.amber,
                    label: Text(
                      '\$${cart.totalAmount().toStringAsFixed(2)}',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(
                        context,
                        listen: false,
                      ).addOrder(
                          cart.items.values.toList(), cart.totalAmount());
                      cart.clear();
                    },
                    child: const Text(
                      'Order Now',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) => CartItem(
                id: cart.items.values.toList()[index].id,
                productId: cart.items.keys.toList()[index],
                title: cart.items.values.toList()[index].title,
                price: cart.items.values.toList()[index].price,
                quantity: cart.items.values.toList()[index].quantity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
