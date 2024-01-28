import 'package:flutter/material.dart';
import 'package:shopping_app/app/data/models/product.dart';
import 'package:shopping_app/app/modules/home/widgets/product_tile.dart';


class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ProductTile(product: product),
        );
      },
    );
  }
}
