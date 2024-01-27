import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/app/data/models/product.dart';

abstract class DataSource {
  Future<List<Product>> getAllProducts();
  Future<List<Product>>getProductsByCategory(String category);
}

class ApiDataSource implements DataSource {
  static const String baseUrl = 'https://fakestoreapi.com';

  @override
  Future<List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print(data);

      // Assuming each item in the response is a product
      final List<Product> products = data
          .whereType<Map<String, dynamic>>() // Filter out non-Map items
          .map((json) => Product.fromJson(json))
          .toList();
      return products;
    } else {
      print('Failed to fetch data: ${response.statusCode}');
      print('Response body: ${response.body}'); // Print the response body for debugging

      // Handle error or return an empty list based on your requirements
      return [];
    }
  }

  @override
Future<List<Product>> getProductsByCategory(String category) async {
  final response = await http.get(Uri.parse('$baseUrl/products/category/$category'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    final List<Product> products = data
        .whereType<Map<String, dynamic>>() // Filter out non-Map items
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
