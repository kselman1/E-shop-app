import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/app/data/models/product.dart';

abstract class DataSource {
 
 Future<List<Product>>_getAllProducts();
}

class ApiDataSource implements DataSource {


  static const String baseUrl = 'https://fakestoreapi.com/';

  @override
  Future<List<Product>>_getAllProducts()async{

     final response = await http.get(Uri.parse('$baseUrl/products'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    print(data);
  } else {
    print('Failed to fetch data: ${response.statusCode}');
  }
  return (response.body as Map<String, dynamic>)
        .values
        .map((value) => Product.fromJson(value))
        .toList();
  }
  
  
}
