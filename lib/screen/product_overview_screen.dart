import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/auth_providers.dart';

import '../providers/cart_provider.dart';
import '../providers/products_provider.dart';
import '../utils/constants.dart';
import '../widget/custom_badge.dart';
import '../widget/products_grid.dart';

enum FilterOptions { Favorites, All, ManageProducts, Orders, Logout }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _isFavoriteSelected = false;
  var _isInit = true;
  var _isLoading = true;

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<ProductsProvider>(context, listen: false).getProducts();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<ProductsProvider>(context).getProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Overview'),
        actions: [
          Consumer<CartProvider>(
            builder: (ctx, cart, ch) => CustomBadge(
              child: ch,
              value: cart.cartItemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(Constants.ROUTE_CART);
              },
            ),
          ),
          PopupMenuButton(
            tooltip: 'More',
            onSelected: (FilterOptions filterOptions) {
              setState(() {
                if (filterOptions == FilterOptions.Favorites) {
                  _isFavoriteSelected = true;
                } else if (filterOptions == FilterOptions.All) {
                  _isFavoriteSelected = false;
                } else if (filterOptions == FilterOptions.ManageProducts) {
                  Navigator.of(context).pushNamed(Constants.ROUTE_MANAGE_PRODUCTS);
                } else if (filterOptions == FilterOptions.Orders) {
                  Navigator.of(context).pushNamed(Constants.ROUTE_ORDERS);
                } else if (filterOptions == FilterOptions.Logout) {
                  Provider.of<AuthProvider>(context, listen: false).logout();
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (ctx) => [
              PopupMenuItem(child: Text('Favorites'), value: FilterOptions.Favorites),
              PopupMenuItem(child: Text('All'), value: FilterOptions.All),
              PopupMenuItem(child: Text('Manage Products'), value: FilterOptions.ManageProducts),
              PopupMenuItem(child: Text('Orders'), value: FilterOptions.Orders),
              PopupMenuItem(child: Text('Logout'), value: FilterOptions.Logout),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ProductsGrid(_isFavoriteSelected),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(
            Constants.ROUTE_EDIT_PRODUCTS,
            arguments: null,
          );
        },
      ),
    );
  }
}
