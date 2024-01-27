import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/app/data/models/product.dart';

abstract class DataSource {
  Future<List<Product>> getAllProducts(String userInput);
  Future<List<Product>>getProductsByCategory(String category);
 
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


}
