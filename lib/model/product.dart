import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  final String dateAndTime;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    @required this.dateAndTime,
    this.isFavorite = false,
  });

  void setFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();

    http.put(Constants.favoriteProduct(id), body: json.encode(isFavorite)).then((response) {
      print('favorite response : ${json.decode(response.body)}');
    });
  }
}
