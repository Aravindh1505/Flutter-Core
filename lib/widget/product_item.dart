import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../providers/cart_provider.dart';
import '../utils/constants.dart';

class ProductItem extends StatelessWidget {
  void selectedProduct(BuildContext context, Product product) {
    Navigator.of(context).pushNamed(Constants.ROUTE_PRODUCT_DETAIL, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<Product>(context, listen: false);
    print('product rebuilding...');

    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 2),
        ),
        child: GestureDetector(
          child: Hero(
            tag: product.id,
            child: FadeInImage(
              fadeInDuration: Duration(milliseconds: 300),
              imageErrorBuilder: (ctx, object, stacktrace) => Image.asset(
                'assets/images/product_placeholder.png',
                fit: BoxFit.cover,
              ),
              placeholder: AssetImage('assets/images/product_placeholder.png'),
              image: NetworkImage(product.imageUrl),
            ),
          ),
          onTap: () {
            selectedProduct(context, product);
          },
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        leading: Consumer<Product>(
          builder: (ctx, product, _) => IconButton(
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              product.setFavorite();
            },
          ),
        ),
        trailing: Consumer<CartProvider>(
          builder: (ctx, cartProvider, _) => IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: cartProvider.isAddedInCart(product.id) ? Colors.amber : Colors.white,
            ),
            onPressed: () {
              cartProvider.addCart(product.id, product.title, product.price);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added item into cart!')));
            },
          ),
        ),
      ),
    );
  }
}
