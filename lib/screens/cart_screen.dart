import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;

import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text("\$${cart.totalAmount}"),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'ORDER NOW',
                        style: TextStyle(fontSize: 10),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) => CartItem(
              cart.items.values.toList()[i].id as String,
              cart.items.keys.toList()[i],
              cart.items.values.toList()[i].price as double,
              cart.items.values.toList()[i].quantity as int,
              cart.items.values.toList()[i].title as String,
            ),
            itemCount: cart.items.length,
          ))
        ],
      ),
    );
  }
}
