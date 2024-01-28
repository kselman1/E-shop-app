import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app/bloc/product_bloc.dart';
import 'package:shopping_app/app/modules/home/widgets/filter_page.dart';
import 'package:shopping_app/app/modules/home/widgets/product_list.dart';
import 'package:shopping_app/app/modules/home/widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: Column(
        children: [
        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSearchBar(
                controller: _searchController,
                onSubmitted: (value) {
                  context.read<ProductBloc>().add(SearchProductsEvent(value));
                },
              ),
              IconButton(onPressed: (){
                
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => FilterPage(),
  ),
);

              }, icon: Icon(Icons.filter))
            ],
          ),
          // ElevatedButtons for different categories
          ElevatedButton(
            onPressed: () {
              context.read<ProductBloc>().add(FetchProductsEvent());
            },
            child: Text('All'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ProductBloc>().add(FetchProductsByCategoryEvent('electronics'));
            },
            child: Text('Electronics'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ProductBloc>().add(FetchProductsByCategoryEvent('jewelry'));
            },
            child: Text('Jewelry'),
          ),
          // BlocBuilder for product states
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ProductLoadedState) {
                  return ProductList(products: state.products);
                } else if (state is ProductErrorState) {
                  return Center(
                    child: Text('Error: ${state.error}'),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
