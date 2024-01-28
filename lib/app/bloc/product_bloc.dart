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
  List<String> clickedCategories = [];

  ProductBloc({required this.dataSource}) : super(ProductInitial()) {
    on<FetchProductsEvent>((event, emit) async {
      
      
        try {
          emit(ProductLoadingState());
          productsList = await dataSource.getAllProducts(userInput);
          
        
          
          emit(ProductLoadedState(productsList));
        } catch (e) {
          emit(ProductErrorState('Failed to fetch products: $e'));
        }
    
    });

    on<FetchProductsByCategoryEvent>((event, emit) async {
     //yield ProductLoadingState();

      try {
        emit(ProductLoadingState());
        final List<Product> products = await dataSource.getProductsByCategory(event.category);
        emit(ProductLoadedState(products));
      } catch (e) {
        emit(ProductErrorState('Failed to fetch products: $e'));
      }
    });
    on<SearchProductsEvent>((event, emit) async {
      userInput = event.userInput;

      
      try {
        emit(ProductLoadingState());
        final List<Product> products = await dataSource.getAllProducts(userInput);
        emit(ProductLoadedState(products));
      } catch (e) {
        emit(ProductErrorState('Failed to fetch products: $e'));
      }
    });
    on<UpdateProductEvent>((event, emit) async{
      
      try {
        emit(ProductLoadingState());
      final Product updatedProduct = await dataSource.updateProduct(event.updatedProduct.id ?? 0, event.updatedProduct);
      
       final int index = productsList.indexWhere((product) => product.id == updatedProduct.id);
       productsList[index]=updatedProduct;
      emit(ProductLoadedState(productsList)); 
    } catch (e) {
      emit(ProductErrorState('Failed to update product: $e'));
    }
  
    }
    
    
    );

    on<DeleteProductEvent>((event, emit) async {
  try {
     emit(ProductLoadingState());
    await dataSource.deleteProduct(event.productId);
    
     productsList.removeWhere((product) => product.id == event.productId);

    emit(ProductLoadedState(productsList));
  } catch (e) {
    emit(ProductErrorState('Failed to delete product: $e'));
  }
});
on<FilterProductsEvent>(((event, emit) async{
  try{
     emit(ProductLoadingState());
    productsList=await dataSource.filterProducts(event.category, event.sortBy, event.numberOfResults);
    emit(ProductLoadedState(productsList));
  }catch (e) {
    emit(ProductErrorState('Failed to filter products: $e'));
  }
}));

}

 



  Stream<ProductState> mapEventToState(ProductEvent event) async* {
  }
}
