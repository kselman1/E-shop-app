// product_details_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app/bloc/product_bloc.dart';
import 'package:shopping_app/app/data/models/product.dart';
import 'package:shopping_app/app/modules/home/widgets/option_popup.dart';
import 'package:shopping_app/app/modules/home/widgets/product_update.dart';


class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
             onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return EditDeleteBottomSheet(
                    onEdit: () {
                      Navigator.pop(context); // Close the bottom sheet
                      _navigateToUpdatePage(context);
                    },
                    onDelete: () {
                      Navigator.pop(context); // Close the bottom sheet
                      _handleDelete(context);
                    },
                  );
                },
              );
            },
          ),
         
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image ?? '',
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              product.title ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Category: ${product.category ?? ''}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Price: ${product.price ?? ''}',
              style: TextStyle(fontSize: 18.0, color: Colors.green),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description: ${product.description ?? ''}',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
  void _navigateToUpdatePage(BuildContext context) {
  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateProductPage(product: product),
          ),
        );
}




void _handleDelete(BuildContext context) {
  // Dispatch a DeleteProductEvent to trigger the deletion logic in the ProductBloc
  context.read<ProductBloc>().add(DeleteProductEvent(product.id ?? 0));
  
  // Navigate back after deleting
  Navigator.pop(context);
}

}
