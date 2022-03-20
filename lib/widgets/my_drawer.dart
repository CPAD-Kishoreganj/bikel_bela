import 'package:bikel_bela/screens/order_screen.dart';
import 'package:bikel_bela/screens/product_detail_screen.dart';
import 'package:bikel_bela/screens/product_overview_screen.dart';
import 'package:bikel_bela/screens/user_product_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: SizedBox(
              height: 100,
              child: Text('My Drawer'),
            ),
          ),
          ListTile(
            tileColor: Colors.black12,
            leading: const Icon(Icons.shop, size: 32),
            title: const Text(
              'Shop',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ProductOverviewScreen.route);
            },
          ),
          const SizedBox(height: 8),
          ListTile(
            tileColor: Colors.black12,
            leading: const Icon(
              Icons.shopping_bag,
              size: 32,
            ),
            title: const Text(
              'Orders',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routName);
            },
          ),
          const SizedBox(height: 8),
          ListTile(
            tileColor: Colors.black12,
            leading: const Icon(
              Icons.edit,
              size: 32,
            ),
            title: const Text(
              'Products',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                UserProductScreen.route,
              );
            },
          ),
        ],
      ),
    );
  }
}
