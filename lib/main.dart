import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:shop_app/providers/cart.dart";

import "./screens/product_detail_screen.dart";
import "./screens/products_overview_screen.dart";
import "./screens/cart_screen.dart";
import "./providers/products.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(create: (ctx) => Cart()),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primaryColor: Colors.green,
          primarySwatch: Colors.orange,
          fontFamily: 'Lato',
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
        },
      ),
    );
  }
}
