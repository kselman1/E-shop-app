import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app/bloc/product_bloc.dart';


class  CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
     //bool isButtonPressed = false;
     List<String> categories = ['All', 'Electronics', 'Jewelry', 'Men\'s Clothing'];
     List<String> catg=['aa','electronics', 'jewelery', 'men\'s clothing'];
     List<String> sel=[];

    return Container(
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFFFF8F0),
      ),
      child: ListView.builder(
         scrollDirection: Axis.horizontal,
                itemCount: categories.length,
        itemBuilder: (context, index){
          if(index==0){
            return ElevatedButton(
              onPressed: () {
                sel.clear();
               sel.add('a');
                context.read<ProductBloc>().add(FetchProductsEvent());
              },
               style: ElevatedButton.styleFrom(
        backgroundColor: sel.contains('a') ? Colors.red : const Color(0xFFFFF8F0), // Change colors as needed
      ),
              child: Text('All'),
            );
          }else{
           return  Padding(
             padding: const EdgeInsets.only(left: 10, right: 10),
             child: ElevatedButton(
                onPressed: () {
                  sel.clear();
                 sel.add(categories[index]);
                  context.read<ProductBloc>().add(FetchProductsByCategoryEvent(catg[index]));
                },
                 style: ElevatedButton.styleFrom(
                     backgroundColor: sel.contains(categories[index]) ? Colors.red : const Color(0xFFFFF8F0), ),
                child: Text(categories[index]),
              ),
           );
          }
        }
        
        ),
    );
  }
}