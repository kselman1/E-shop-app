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

class ProductEditingState extends ProductState {
  final Product product;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;

  ProductEditingState(
    this.product,
    this.titleController,
    this.descriptionController,
    this.priceController,
  );
  
}
class ProductDeletingState extends ProductState {
  final int productId;

  ProductDeletingState(this.productId);
}


class ClickedCategoriesState extends ProductState {
  final List<String> clickedCategories;

  ClickedCategoriesState(this.clickedCategories);
}
