import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../providers/products_provider.dart';
import '../utils/constants.dart';

class EditProductScreen extends StatefulWidget {
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  String _imageURL = 'https://pixselo.com/wp-content/uploads/2018/03/dummy-placeholder-image-400x400.jpg';
  Product _existingProduct = Product(
    id: DateTime.now().toString(),
    title: '',
    description: '',
    price: -1,
    imageUrl: '',
  );

  final _form = GlobalKey<FormState>();

  String _existingProductId = '';
  bool _isEdit = false;
  bool _isLoading = false;

  String title = 'Add Product';

  Future<void> _save() async {
    final isValid = _form.currentState.validate();

    if (!isValid) {
      return;
    }

    _form.currentState.save();
    print(_existingProduct.id);
    print(_existingProduct.title);
    print(_existingProduct.description);
    print(_existingProduct.price);
    print(_existingProduct.imageUrl);

    setState(() {
      _isLoading = true;
    });

    if (_isEdit) {
      await Provider.of<ProductsProvider>(context, listen: false).updateProduct(_existingProductId, _existingProduct);
    } else {
      try {
        await Provider.of<ProductsProvider>(context, listen: false).addProduct(_existingProduct);
      } catch (error) {
        await showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Error occurred!'),
            content: Text('Something went wrong...'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text('Okay'),
              ),
            ],
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context).settings.arguments as Product;
    if (product != null) {
      title = 'Edit Product';
      _existingProductId = product.id;
      _isEdit = true;
      print('product title :  ${product.title}');

      _imageURL = product.imageUrl;
      _existingProduct = product;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _save();
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Form(
                key: _form,
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: _existingProduct.title,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          _existingProduct = Product(
                            id: _existingProduct.id,
                            title: value,
                            description: _existingProduct.description,
                            price: _existingProduct.price,
                            imageUrl: _existingProduct.imageUrl,
                            isFavorite: _existingProduct.isFavorite,
                          );
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter valid title';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        initialValue: _existingProduct.price.isNegative ? '' : _existingProduct.price.toString(),
                        decoration: InputDecoration(
                          labelText: 'Price',
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          _existingProduct = Product(
                            id: _existingProduct.id,
                            title: _existingProduct.title,
                            description: _existingProduct.description,
                            price: double.parse(value),
                            imageUrl: _existingProduct.imageUrl,
                            isFavorite: _existingProduct.isFavorite,
                          );
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter valid price';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        initialValue: _existingProduct.description,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        onSaved: (value) {
                          _existingProduct = Product(
                            id: _existingProduct.id,
                            title: _existingProduct.title,
                            description: value,
                            price: _existingProduct.price,
                            imageUrl: _existingProduct.imageUrl,
                            isFavorite: _existingProduct.isFavorite,
                          );
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter valid description';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        initialValue: _existingProduct.imageUrl,
                        decoration: InputDecoration(
                          labelText: 'Enter Image URL',
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.done,
                        onSaved: (value) {
                          _existingProduct = Product(
                            id: _existingProduct.id,
                            title: _existingProduct.title,
                            description: _existingProduct.description,
                            price: _existingProduct.price,
                            imageUrl: value,
                            isFavorite: _existingProduct.isFavorite,
                          );

                          setState(() {
                            print(value);
                            if (Constants.isValidURL(value)) {
                              _imageURL = value;
                            }
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter valid image URL';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 200,
                        width: 200,
                        child: Image.network(
                          _imageURL,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
