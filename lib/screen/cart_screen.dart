import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/orders_provider.dart';

import '../providers/cart_provider.dart';
import '../widget/cart_item.dart';
import '../widget/custom_widgets.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: CustomWidgets.getAppBar(context, 'Your Cart'),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Chip(
                    padding: const EdgeInsets.all(5),
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      '\$ ${cartProvider.totalAmount}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: cartProvider.totalAmount <= 0
                        ? null
                        : () {
                            Provider.of<OrdersProvider>(context, listen: false).addOrder(
                              cartProvider.cartItems.values.toList(),
                              cartProvider.totalAmount,
                            );
                            cartProvider.clearItems();
                          },
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) => CartItem(
                cartProvider.cartItems.values.toList()[index],
                cartProvider.cartItems.keys.toList()[index],
              ),
              itemCount: cartProvider.cartItems.length,
            ),
          )
        ],
      ),
    );
  }
}
