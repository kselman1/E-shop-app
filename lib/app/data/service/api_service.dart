import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/app/data/models/product.dart';

abstract class DataSource {
  Future<List<Product>> getAllProducts(String userInput);
  Future<List<Product>> filterProducts(String category, String sortBy, int numberOfResults);
  Future<List<Product>> getProductsByCategory(String category);
  Future<Product> updateProduct(int productId, Product product);
  Future<void> deleteProduct(int productId);
}

class ApiDataSource implements DataSource {
  // Primary API: Platzi Fake Store (Stable & Has images)
  static const String baseUrl = 'https://api.escuelajs.co/api/v1';

  @override
  Future<List<Product>> getAllProducts(String userInput) async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Product> allProducts = data
          .map((json) => Product.fromJson(json as Map<String, dynamic>))
          .toList();

      if (userInput.isNotEmpty) {
        return allProducts.where((p) => 
          p.title?.toLowerCase().contains(userInput.toLowerCase()) ?? false
        ).toList();
      }
      return allProducts;
    }
    return [];
  }

 @override

  Future<List<Product>> getProductsByCategory(String category) async {

    int categoryId = 1;
    if (category.toLowerCase().contains('elect')) categoryId = 2;
    if (category.toLowerCase().contains('furn')) categoryId = 3;
    if (category.toLowerCase().contains('shoe')) categoryId = 4;

    final response = await http.get(Uri.parse('$baseUrl/products/?categoryId=$categoryId'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
   
      return data.map((json) => Product.fromJson(json as Map<String, dynamic>)).toList();
    }
    return [];
  }
  @override
  Future<List<Product>> filterProducts(String category, String sortBy, int numberOfResults) async {
    // FIX: Calling Platzi URL, NOT DummyJSON
    final response = await http.get(Uri.parse('$baseUrl/products'));
    
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      // FIX: Platzi returns a List, so we map directly (No ['products'] key)
      List<Product> allProducts = data
          .map((json) => Product.fromJson(json as Map<String, dynamic>))
          .toList();
      
      // Sorting Logic
      if (sortBy == 'desc') {
        allProducts.sort((a, b) => (b.price ?? 0).compareTo(a.price ?? 0));
      } else if (sortBy == 'asc') {
        allProducts.sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
      }

      // Category Filtering (Client-side)
      if (category.isNotEmpty && category != 'All') {
        allProducts = allProducts.where((product) => 
          product.category?.toLowerCase() == category.toLowerCase()
        ).toList();
      }

      if (numberOfResults > 0) {
        allProducts = allProducts.take(numberOfResults).toList();
      }

      return allProducts;
    } else {
      print('Failed to fetch data: ${response.statusCode}');
      return [];
    }
  }

  @override
  Future<Product> updateProduct(int productId, Product updatedProduct) async {
    final response = await http.put(
      Uri.parse('$baseUrl/products/$productId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedProduct.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Product.fromJson(data);
    } else {
      throw Exception('Failed to update product: ${response.statusCode}');
    }
  }

  @override
  Future<void> deleteProduct(int productId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/products/$productId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete product: ${response.statusCode}');
    }
  }
}