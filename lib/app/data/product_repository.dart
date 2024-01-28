import 'package:flutter/material.dart';
import 'package:shopping_app/app/data/models/product.dart';
import 'package:shopping_app/app/data/service/api_service.dart';

class ProductRepository {
  const ProductRepository({
    required this.service,
  });
  final DataSource service;

  Future<List<Product>> getAllProducts(String userInput) async => service.getAllProducts(userInput);
  Future<List<Product>> getProductsByCategory(String category) async => service.getProductsByCategory(category);
  Future<Product>updateProduct(int productId, Product product, BuildContext context) async=> service.updateProduct(productId, product);
  Future<void>deleteProduct(int productId) async=>service.deleteProduct(productId);
  
  


}