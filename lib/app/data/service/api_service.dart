import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app/app/data/models/product.dart';

abstract class DataSource {
  Future<List<Product>>getAllProducts(String userInput);
  Future<List<Product>> filterProducts(String category, String sortBy, int numberOfResults);
  Future<List<Product>>getProductsByCategory(String category);
  Future<Product> updateProduct(int productId, Product product);
  Future<void> deleteProduct(int productId);
  
 
}

class ApiDataSource implements DataSource {
  static const String baseUrl = 'https://fakestoreapi.com';

  /*@override
  Future<List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
     

    
      final List<Product> products = data
          .whereType<Map<String, dynamic>>() 
          .map((json) => Product.fromJson(json))
          .toList();
      return products;
    } else {
      print('Failed to fetch data: ${response.statusCode}');
      print('Response body: ${response.body}'); 

      
      return [];
    }
  }*/
  @override
  Future<List<Product>> getAllProducts(String userInput) async {
  

    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      final List<Product> allProducts = data
          .whereType<Map<String, dynamic>>()
          .map((json) => Product.fromJson(json))
          .toList();
      //dodat else if za ostale stvariv i vidjet kako je za search 
      if (userInput.isNotEmpty) {
        final String userInputLowerCase = userInput.toLowerCase();
        return allProducts.where((product) =>
          product.title?.toLowerCase().contains(userInputLowerCase) == true ||
          product.category?.toLowerCase().contains(userInputLowerCase) == true
        ).toList();
      } else {
        return allProducts;
      }
    } else {
      print('Failed to fetch data: ${response.statusCode}');
      print('Response body: ${response.body}');

      return [];
    }
  }@override
Future<List<Product>> filterProducts(String category, String sortBy, int numberOfResults) async {
  const String apiUrl =  '$baseUrl/products';

  final response = await http.get(Uri.parse(apiUrl));
  
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);

    List<Product> allProducts = data
        .whereType<Map<String, dynamic>>()
        .map((json) => Product.fromJson(json))
        .toList();
    
    if (sortBy == 'desc') {
      allProducts.sort((a, b) => a.price!.compareTo(b.price!));
    } else if (sortBy == 'asc') {
      allProducts.sort((a, b) => b.price!.compareTo(a.price!));
    }
    if (category.isNotEmpty && category!='All') {
      allProducts.retainWhere((product) => product.category == category);
    }


    if (numberOfResults > 0) {
      allProducts = allProducts.take(numberOfResults).toList();
    }

    return allProducts;
  } else {
    print('Failed to fetch data: ${response.statusCode}');
    print('Response body: ${response.body}');

    return [];
  }
}



  @override
Future<List<Product>> getProductsByCategory(String category) async {
  final response = await http.get(Uri.parse('$baseUrl/products/category/$category'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    final List<Product> products = data
        .whereType<Map<String, dynamic>>()
        .map((json) => Product.fromJson(json))
        .toList();
    return products;
  } else {
    print('Failed to fetch data: ${response.statusCode}');
    print('Response body: ${response.body}');
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
      print('ddddd');

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

  if (response.statusCode == 200) {
    print('Product deleted successfully');
  } else {
    throw Exception('Failed to delete product: ${response.statusCode}');
  }
}




}
