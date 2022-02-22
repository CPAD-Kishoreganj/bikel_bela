import 'package:bikel_bela/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final DateTime date;
  final double amount;
  final List<CartItem> cartProducts;
  const OrderItem({
    Key? key,
    required this.cartProducts,
    required this.date,
    required this.amount,
  }) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expand = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      margin: const EdgeInsets.all(12),
      child: Column(
        children: [
          ListTile(
            title: Text(DateFormat("yyyy-MM-dd HH:mm:ss").format(widget.date)),
            subtitle: Text("\$${widget.amount.toString()}"),
            trailing: IconButton(
              icon: _expand ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expand = !_expand;
                });
              },
            ),
          ),
          if (_expand)
            Container(
              height: widget.cartProducts.length * 20 + 20,
              color: Colors.black12,
              child: ListView(
                children: widget.cartProducts
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item.title),
                            Text('${item.quantity} x'),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
