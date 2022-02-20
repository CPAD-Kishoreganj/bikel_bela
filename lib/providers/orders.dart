import 'package:bikel_bela/providers/cart.dart';
import 'package:flutter/cupertino.dart';

class OrderItem {
  String id;
  double amount;
  List<CartItem> cartItems;
  DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.cartItems,
    required this.dateTime,
  });
}

class Orders extends ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        cartItems: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
