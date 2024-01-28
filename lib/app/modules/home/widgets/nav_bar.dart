
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app/bloc/product_bloc.dart';


class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: // Inside CustomNavBar build method

BlocBuilder<ProductBloc, ProductState>(
  builder: (context, state) {
  
    if (state is ClickedCategoriesState) {
      List<String> categories = ['All', 'Electronics', 'Jewelry', 'Mens Clothing'];

      return SizedBox(
        height: 48,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            String category = categories[index];
            bool isClicked = state.clickedCategories.contains(category);

            return buildNavItem(context, category, isClicked);
          },
        ),
      );
    }
    return Container();
  },
)



    );
  }

  Widget buildNavItem(BuildContext context, String category, bool isClicked) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          context.read<ProductBloc>().add(ChangeCategoryEvent(category));
        },
        style: ElevatedButton.styleFrom(
          primary: isClicked ? Colors.red : Colors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}