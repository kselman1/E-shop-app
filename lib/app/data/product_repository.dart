import 'package:shopping_app/app/data/models/product.dart';
import 'package:shopping_app/app/data/service/api_service.dart';

class ProductRepository {
  const ProductRepository({
    required this.service,
  });
  final DataSource service;

  Future<List<Product>> getAllProducts() async => service.getAllProducts();
   Future<List<Product>> getProductsByCategory(String category) async => service.getProductsByCategory(category);


}