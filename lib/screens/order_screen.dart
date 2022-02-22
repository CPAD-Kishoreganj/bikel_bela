import 'package:bikel_bela/providers/orders.dart' show Orders;
import 'package:bikel_bela/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bikel_bela/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routName = 'order-screen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index) => OrderItem(
          date: orderData.orders[index].dateTime,
          amount: orderData.orders[index].amount,
          cartProducts: orderData.orders[index].cartItems,
        ),
      ),
    );
  }
}
