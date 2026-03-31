import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  
  // Platzi returns images as a List of strings
  List<String>? images;

  // This helper maps the Platzi category object to a simple string for your UI
  @JsonKey(name: 'category')
  Map<String, dynamic>? categoryData;

  String? get category => categoryData?['name'];
  String? get image => (images != null && images!.isNotEmpty) ? images![0] : null;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.categoryData,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}