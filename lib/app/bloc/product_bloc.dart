import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/app/data/models/product.dart';
import 'package:shopping_app/app/data/service/api_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final DataSource dataSource;
  String userInput = ''; 
  List<Product> productsList=[];
  bool productsLoaded=false;

  ProductBloc({required this.dataSource}) : super(ProductInitial()) {
    on<FetchProductsEvent>((event, emit) async {
      // Check if products have already been loaded
      
        try {
          productsList = await dataSource.getAllProducts(userInput);
        
          
          emit(ProductLoadedState(productsList));
        } catch (e) {
          emit(ProductErrorState('Failed to fetch products: $e'));
        }
    
    });

    on<FetchProductsByCategoryEvent>((event, emit) async {
     //yield ProductLoadingState();

      try {
        final List<Product> products = await dataSource.getProductsByCategory(event.category);
        emit(ProductLoadedState(products));
      } catch (e) {
        emit(ProductErrorState('Failed to fetch products: $e'));
      }
    });
    on<SearchProductsEvent>((event, emit) async {
      userInput = event.userInput;
      
      try {
        final List<Product> products = await dataSource.getAllProducts(userInput);
        emit(ProductLoadedState(products));
      } catch (e) {
        emit(ProductErrorState('Failed to fetch products: $e'));
      }
    });
    on<UpdateProductEvent>((event, emit) async{
      
      try {
      final Product updatedProduct = await dataSource.updateProduct(event.updatedProduct.id ?? 0, event.updatedProduct);
      
       final int index = productsList.indexWhere((product) => product.id == updatedProduct.id);
       productsList[index]=updatedProduct;
      emit(ProductLoadedState(productsList)); // Assuming you want to refresh the UI with the updated product
    } catch (e) {
      emit(ProductErrorState('Failed to update product: $e'));
    }
  
    }
    
    
    );

    on<DeleteProductEvent>((event, emit) async {
  try {
    // Assume you have a function in your DataSource to delete the product
    await dataSource.deleteProduct(event.productId);

    // Transition to the ProductDeletingState
    
     productsList.removeWhere((product) => product.id == event.productId);

    emit(ProductLoadedState(productsList));
  } catch (e) {
    emit(ProductErrorState('Failed to delete product: $e'));
  }
});
  


    
  }
  
 



  Stream<ProductState> mapEventToState(ProductEvent event) async* {
  
}
}
