import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/product.dart';
import '../utils/constants.dart';
import '../utils/custom_exception.dart';

class ProductsProvider with ChangeNotifier {
  String _authToken;
  String _userId;
  List<Product> _productItems = [];

  void update(String authToken, String userId) {
    _authToken = authToken;
    _userId = userId;
  }

  List<Product> get productItems {
    return [..._productItems];
  }

  List<Product> get favoriteItems {
    return _productItems.where((product) => product.isFavorite).toList();
  }

  Future<void> getProducts() async {
    print('_userId : $_userId');

    final List<Product> extractedProducts = [];
    try {
      final response = await http.get(Constants.productUserBasedPathURL);

      final favoriteResponse = await http.get(Constants.favoriteProduct(null));

      var result = json.decode(response.body) as Map<String, dynamic>;

      var favoriteResponseBody = json.decode(favoriteResponse.body);

      if (result != null && result.isNotEmpty) {
        result.forEach(
          (productId, product) {
            extractedProducts.add(
              Product(
                id: productId,
                title: product['title'],
                description: product['description'],
                price: (product['price'] as num).toDouble(),
                imageUrl: product['image_url'],
                isFavorite: favoriteResponseBody == null ? false : favoriteResponseBody[productId] ?? false,
              ),
            );
          },
        );
        _productItems = extractedProducts;
        notifyListeners();
      }
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      final response = await http.post(
        Constants.productPathURL,
        body: json.encode(
          {
            'userId': _userId,
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'image_url': product.imageUrl,
            'createdAt': DateTime.now().toString(),
            'updatedAt': DateTime.now().toString(),
          },
        ),
      );

      var body = json.decode(response.body);
      _productItems.add(Product(
        id: body['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      ));
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String productId, Product product) async {
    final index = _productItems.indexWhere((element) => element.id == productId);
    if (index >= 0) {
      try {
        final response = await http.patch(Constants.productUpdateURL(productId),
            body: json.encode({
              'title': product.title,
              'description': product.description,
              'price': product.price,
              'image_url': product.imageUrl,
              'updatedAt': DateTime.now().toString(),
            }));

        _productItems[index] = product;
        notifyListeners();
      } catch (error) {
        print(error);
        throw error;
      }
    }
  }

  void deleteProduct(String productId) {
    final existingProductIndex = _productItems.indexWhere((element) => element.id == productId);
    var product = _productItems[existingProductIndex];

    http.delete(Constants.productUpdateURL(productId)).then((response) {
      print(response.statusCode);
      if (response.statusCode != 200) {
        _productItems.insert(existingProductIndex, product);
        notifyListeners();
      }
    }).catchError((error) {
      print(error.toString());
      _productItems.insert(existingProductIndex, product);
      notifyListeners();
      throw CustomException('Oop\'s, not able to delete the product!');
    });

    _productItems.removeWhere((element) => element.id == productId);
    notifyListeners();
  }
}
