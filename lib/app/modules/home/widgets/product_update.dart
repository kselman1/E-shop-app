import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app/bloc/product_bloc.dart';
import 'package:shopping_app/app/data/models/product.dart';
import 'package:shopping_app/app/data/service/api_service.dart';

class UpdateProductPage extends StatelessWidget {
  final Product product;

  UpdateProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(text: product.title);
    TextEditingController descriptionController = TextEditingController(text: product.description);
    TextEditingController priceController = TextEditingController(text: product.price.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Prepare updated product data
              final updatedProduct = Product(
                id: product.id,
                title: titleController.text,
                description: descriptionController.text,
                price: double.tryParse(priceController.text),
                image: product.image,
                category: product.category,
              );

              // Call the API to update the product
              ApiDataSource().updateProduct(product.id ?? 0, updatedProduct).then((updatedProduct) {
                // Optionally, dispatch an event to update the product list in the Bloc
                context.read<ProductBloc>().add(UpdateProductEvent(updatedProduct));

                // Navigate back after updating
                Navigator.pop(context);
              }).catchError((error) {
                // Handle the error
                print('Error updating product: $error');
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Product Description'),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Product Price'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Prepare updated product data
                final updatedProduct = Product(
                  id: product.id,
                  title: titleController.text,
                  description: descriptionController.text,
                  price: double.tryParse(priceController.text),
                  image: product.image,
                  category: product.category,
                );

                // Call the API to update the product
                ApiDataSource().updateProduct(product.id ?? 0, updatedProduct).then((updatedProduct) {
                  // Optionally, dispatch an event to update the product list in the Bloc
                  context.read<ProductBloc>().add(UpdateProductEvent(updatedProduct));

                  // Navigate back after updating
                  Navigator.pop(context);
                  Navigator.pop(context);
                }).catchError((error) {
                  // Handle the error
                  print('Error updating product: $error');
                });
              },
              child: Text('Edit Product'),
            ),
          ],
        ),
      ),
    );
  }
}
