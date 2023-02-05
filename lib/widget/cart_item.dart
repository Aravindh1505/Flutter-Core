import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';
import '../providers/cart_provider.dart';

class CartItem extends StatelessWidget {
  final Cart cart;
  final String productId;

  CartItem(this.cart, this.productId);

  @override
  Widget build(BuildContext context) {
    print('cart items $cart');

    return Dismissible(
      key: ValueKey(cart.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          iconSize: 40,
        ),
        margin: const EdgeInsets.all(10),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false).removeCart(productId);
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 5,
        child: Expanded(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text('\$ ${cart.price}'),
                ),
              ),
            ),
            title: Text(cart.title),
            subtitle: Text('Total : ${(cart.price * cart.quantity)}'),
            trailing: Text(
              '${cart.quantity} x ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
