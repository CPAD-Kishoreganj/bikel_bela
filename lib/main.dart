import 'package:bikel_bela/on_boarding_screen.dart';
import 'package:bikel_bela/providers/cart.dart';
import 'package:bikel_bela/providers/orders.dart';
import 'package:bikel_bela/providers/products.dart';
import 'package:bikel_bela/screens/cart_screen.dart';
import 'package:bikel_bela/screens/edit_user_products_screen.dart';
import 'package:bikel_bela/screens/order_screen.dart';
import 'package:bikel_bela/screens/product_detail_screen.dart';
import 'package:bikel_bela/screens/user_product_screen.dart';
import 'package:bikel_bela/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          OnBoardingScreen.route: (context) => OnBoardingScreen(),
          ProductOverviewScreen.route: (context) =>
              const ProductOverviewScreen(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.route: (context) => CartScreen(),
          OrderScreen.routName: (context) => OrderScreen(),
          UserProductScreen.route: (context) => const UserProductScreen(),
          EditUserProductsScreen.route: (context) =>
              const EditUserProductsScreen()
        },
      ),
    );
  }
}
