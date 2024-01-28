import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app/bloc/product_bloc.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Products'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
          ElevatedButton(
            onPressed: () {
              context.read<ProductBloc>().add(FetchProductsByCategoryEvent('men\'s clothing'));
            },
            child: Text('Mens Clothing'),
          ),
        ],
      ),
    );
  }
}
