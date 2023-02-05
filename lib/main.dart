import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/auth_providers.dart';
import './providers/cart_provider.dart';
import './providers/orders_provider.dart';
import './providers/products_provider.dart';
import './screen/auth_screen.dart';
import './screen/cart_screen.dart';
import './screen/edit_product_screen.dart';
import './screen/manage_products_screen.dart';
import './screen/orders_screen.dart';
import './screen/product_detail_screen.dart';
import './screen/product_overview_screen.dart';
import './screen/splash_screen.dart';
import './utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, ProductsProvider>(
          create: (_) => ProductsProvider(),
          update: (_, auth, products) => products..update(auth.authToken, auth.userId),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrdersProvider(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (_, auth, __) => MaterialApp(
          title: Constants.APP_NAME,
          theme: Constants.lightTheme,
          home: auth.isAuthenticated
              ? ProductOverviewScreen()
              : FutureBuilder(
                  future: auth.autoLogin(),
                  builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting ? SplashScreen() : AuthScreen(),
                ),
          routes: {
            Constants.ROUTE_PRODUCT_OVERVIEW: (_) => ProductOverviewScreen(),
            Constants.ROUTE_PRODUCT_DETAIL: (_) => ProductDetailScreen(),
            Constants.ROUTE_CART: (_) => CartScreen(),
            Constants.ROUTE_MANAGE_PRODUCTS: (_) => ManageProductsScreen(),
            Constants.ROUTE_EDIT_PRODUCTS: (_) => EditProductScreen(),
            Constants.ROUTE_ORDERS: (_) => OrdersScreen(),
          },
        ),
      ),
    );
  }
}
