import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../utils/constants.dart';
import '../widget/manage_products_item.dart';

class ManageProductsScreen extends StatelessWidget {
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<ProductsProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                Constants.ROUTE_EDIT_PRODUCTS,
                arguments: null,
              );
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Consumer<ProductsProvider>(
          builder: (_, productsData, __) => ListView.builder(
            itemBuilder: (_, index) => ManageProductsItem(productsData.productItems[index]),
            itemCount: productsData.productItems.length,
          ),
        ),
      ),
    );
  }
}
