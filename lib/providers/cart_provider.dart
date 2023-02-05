import 'package:flutter/foundation.dart';

import '../model/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};

  Map<String, Cart> get cartItems {
    return {..._cartItems};
  }

  int get cartItemCount {
    return _cartItems.length;
  }

  bool isAddedInCart(String productId) {
    return _cartItems.containsKey(productId);
  }

  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach((key, cart) {
      total += cart.price * cart.quantity;
    });
    return total;
  }

  void removeCart(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void addCart(String productId, String title, double price) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingProduct) => Cart(
          id: existingProduct.id,
          title: existingProduct.title,
          quantity: existingProduct.quantity + 1,
          price: existingProduct.price,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => Cart(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void clearItems() {
    _cartItems = {};
    notifyListeners();
  }
}
