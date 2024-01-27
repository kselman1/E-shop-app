part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class FetchProductsEvent extends ProductEvent {}

class FetchProductsByCategoryEvent extends ProductEvent {
  final String category;

  FetchProductsByCategoryEvent(this.category);
}
class SearchProductsEvent extends ProductEvent {
  final String userInput;

  SearchProductsEvent(this.userInput);
}