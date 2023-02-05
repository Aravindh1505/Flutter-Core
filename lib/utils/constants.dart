import 'package:flutter/material.dart';
import 'package:shopping_app/helpers/custom_route.dart';

import '../model/product.dart';

class Constants {
  static const APP_NAME = 'Shopping App';

  static String authToken = '';
  static String userId = '';

  static const BASE_URL = 'https://flutter-shop-app-cbef4.firebaseio.com/';
  static final productPathURL = BASE_URL + '/products.json?auth=$authToken';
  static final productUserBasedPathURL = BASE_URL + '/products.json?auth=$authToken&orderBy="userId"&equalTo="$userId"';
  static final productOrdersURL = BASE_URL + '/orders/$userId.json?auth=$authToken';

  static String productUpdateURL(String productId) => '${Constants.BASE_URL}products/$productId.json';

  static String favoriteProduct(String productId) {
    if (productId == null) {
      return '${Constants.BASE_URL}userFavorites/$userId.json?auth=$authToken';
    } else {
      return '${Constants.BASE_URL}userFavorites/$userId/$productId.json?auth=$authToken';
    }
  }

  static const String AUTH_SIGNUP = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBjhM1Yz3mFVBwy8wJ0ifhM_spkYdX_yR8';
  static const String AUTH_SIGNIN = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBjhM1Yz3mFVBwy8wJ0ifhM_spkYdX_yR8';

  /*ROUTES*/
  static const ROUTE_HOME = '/';
  static const ROUTE_PRODUCT_OVERVIEW = '/product-overview';
  static const ROUTE_PRODUCT_DETAIL = '/product-detail';
  static const ROUTE_CART = '/cart';
  static const ROUTE_MANAGE_PRODUCTS = '/manage-products';
  static const ROUTE_EDIT_PRODUCTS = '/edit-products';
  static const ROUTE_ORDERS = '/orders';

  static ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue,
      accentColor: Colors.amber,
      buttonColor: Colors.amber,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Raleway',
      textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            bodyText2: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w200,
            ),
            headline6: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            subtitle1: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            headline3: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
        TargetPlatform.iOS: CustomPageTransitionBuilder(),
      }));

  static List<Product> getProductList = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl: 'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl: 'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  static bool isValidURL(String url) {
    var urlPattern = r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
    return new RegExp(urlPattern, caseSensitive: false).hasMatch(url);
  }

  static const SAMPLE_TEXT =
      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.';
}
