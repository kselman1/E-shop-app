import 'package:flutter/material.dart';
import 'package:shopping_app/app/data/models/product.dart';


class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.title ?? ''),
          subtitle: Text(product.description ?? ''),
          // Customize the ListTile based on your product model
        );
      },
    );
  }
}
