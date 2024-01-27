part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<Product> products;

  ProductLoadedState(this.products);
}

class ProductErrorState extends ProductState {
  final String error;

  ProductErrorState(this.error);
}