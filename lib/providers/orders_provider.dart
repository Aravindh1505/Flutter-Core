import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/cart.dart';
import '../model/orders.dart';
import '../utils/constants.dart';

class OrdersProvider with ChangeNotifier {
  List<Orders> _orders = [];

  List<Orders> get orders {
    return [..._orders];
  }

  void addOrder(List<Cart> cartProducts, double totalAmount) async {
    var timeStamp = DateTime.now();

    final response = await http.post(Constants.productOrdersURL,
        body: json.encode({
          'amount': totalAmount,
          'dateTime': timeStamp.toIso8601String(),
          'products': cartProducts
              .map((cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'quantity': cp.quantity,
                    'price': cp.price,
                  })
              .toList(),
        }));

    _orders.insert(
        0,
        Orders(
          id: jsonDecode(response.body)['name'],
          amount: totalAmount,
          products: cartProducts,
          dateTime: DateTime.now(),
        ));
    notifyListeners();
  }

  Future<void> fetchAndSetOrders() async {
    final response = await http.get(Constants.productOrdersURL);
    final List<Orders> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(
        Orders(
          id: orderId,
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => Cart(
                  id: item['id'],
                  price: item['price'],
                  quantity: item['quantity'],
                  title: item['title'],
                ),
              )
              .toList(),
        ),
      );
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }
}
