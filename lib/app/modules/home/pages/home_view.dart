import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app/bloc/product_bloc.dart';
import 'package:shopping_app/app/modules/home/widgets/filter_page.dart';

import 'package:shopping_app/app/modules/home/widgets/navigation_bar.dart';
import 'package:shopping_app/app/modules/home/widgets/product_list.dart';
import 'package:shopping_app/app/modules/home/widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double maxW=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        
        title: Padding(
          padding:  EdgeInsets.only(left: (16/390)*maxW),
          child:  const Text('Products',  style:  TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700
                        ),),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: (16/390)*maxW, right: (16/390)*maxW),
        child: Column(
          children: [
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomSearchBar(
                  controller: _searchController,
                  onSubmitted: (value) {
                    context.read<ProductBloc>().add(SearchProductsEvent(value));
                  },
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilterPage(),
                          ),
                        );
                  },
                  child: Container(
                    height: 48,
                    width: (44/390)*maxW,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFFFFF8F0),
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 18,
                        width: 16,
                        child: Image.asset('assets/images/Filter.png')),
                    ),
                  ),
                ),
                
              ],
            ),
            const SizedBox(height: 15,),
           const CustomNavigationBar(),
            const SizedBox(height: 15,),
          
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color:  Color(0xFF92140C),
                      ),
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
      ),
    );
  }
}
