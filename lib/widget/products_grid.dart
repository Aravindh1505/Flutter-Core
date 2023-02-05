import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../providers/products_provider.dart';
import '../widget/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool isFavoriteSelected;

  ProductsGrid(this.isFavoriteSelected);

  @override
  Widget build(BuildContext context) {
    var productsData = Provider.of<ProductsProvider>(context);
    List<Product> productList = isFavoriteSelected ? productsData.favoriteItems : productsData.productItems;

    return productsData.productItems.length == 0
        ? Center(
            child: Text('No products found'),
          )
        : GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 3.5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              value: productList[index],
              child: ProductItem(),
            ),
            itemCount: productList.length,
          );
  }
}
