// home_view.dart
// ...

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app/bloc/product_bloc.dart';
import 'package:shopping_app/app/modules/home/widgets/product_list.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
        actions: [
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
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
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
            return Container(); // Initial state or any other state handling
          }
        },
      ),
    );
  }
}
