import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../providers/products_provider.dart';
import '../utils/constants.dart';

class ManageProductsItem extends StatelessWidget {
  final Product product;

  ManageProductsItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(5),
      child: ListTile(
        title: Text(product.title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(product.imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Constants.ROUTE_EDIT_PRODUCTS,
                    arguments: product,
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () {
                  Provider.of<ProductsProvider>(context, listen: false).deleteProduct(product.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
