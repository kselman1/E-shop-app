import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/app/data/models/product.dart';
import 'package:shopping_app/app/data/service/api_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final DataSource dataSource;
  String userInput = ''; 

  ProductBloc({required this.dataSource}) : super(ProductInitial()) {
    on<FetchProductsEvent>((event, emit) async {
      //yield ProductLoadingState();

      try {
        final List<Product> products = await dataSource.getAllProducts(userInput);
        emit(ProductLoadedState(products));
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
  }
 



  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    // This method should be empty as we've handled events using the `on` method.
  }
}
