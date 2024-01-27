import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app/data/service/api_service.dart';
import 'package:shopping_app/app/modules/home/pages/home_view.dart';

import 'app/bloc/product_bloc.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      home: BlocProvider(
        create: (context) => ProductBloc(dataSource: ApiDataSource())..add(FetchProductsEvent()),
        child: HomeView(),
      ),
    );
  }
}
