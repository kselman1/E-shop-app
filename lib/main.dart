import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app/bloc/product_bloc.dart';
import 'package:shopping_app/app/data/service/api_service.dart';
import 'package:shopping_app/app/modules/home/pages/home_view.dart';


void main() {
  runApp(
    RepositoryProvider(
      create: (context) => ApiDataSource(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(
            create: (context) => ProductBloc(dataSource: context.read<ApiDataSource>())..add(FetchProductsEvent()),
          ),
          // Add other Bloc providers if needed
        ],
        child: const MyApp(),
      ),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      home: HomeView(),
      );
    
  }
}
